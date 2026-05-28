#! /usr/bin/env -S R --silent --no-echo --vanilla -e 'source(tail(commandArgs(), 1L))' --args

# Watch for changes to .Rmd files and re-render on update to .md

exts <- c("Rmd", "qmd")

query_rmds <- function(exts) {
  pattern <- paste0("\\.(", paste0(exts, collapse = "|"), ")$")

  rmds <- list.files(
    recursive = TRUE,
    full.names = TRUE,
    pattern = pattern,
    ignore.case = TRUE
  )

  mds <- sub(pattern, ".md", rmds)

  # add 'attempted render time'
  rmds <- cbind(path = rmds, file.info(rmds), rtime = as.POSIXct(NA))
  mds <- cbind(path = mds, file.info(mds))
  data.frame("in" = rmds, out = mds)
}

files <- query_rmds(exts)
repeat {
  new_files <- query_rmds(exts)

  # remove deleted files
  is_old <- files[, "in.path"] %in% new_files[, "in.path"]
  files <- files[is_old, ]

  # update existing files' mtimes
  files <- merge(files, new_files[, c("in.path", "in.mtime")])

  # add new files
  is_new <- !new_files[, "in.path"] %in% files[, "in.path"]
  files <- rbind(files, new_files[is_new, ])

  is_rendered <- !is.na(files[, "out.mtime"])
  is_attempted <- !is.na(files[, "in.rtime"])

  is_modified <- !is_attempted &
    (!is_rendered | files[, "out.mtime"] < files[, "in.mtime"])

  is_modified_since_attempt <- is_attempted &
    files[, "in.rtime"] < files[, "in.mtime"]

  needs_update <- is_modified | is_modified_since_attempt

  for (i in which(needs_update)) {
    message("rendering ", files[[i, "in.path"]])
    files[[i, "in.rtime"]] <- Sys.time()

    tryCatch(
      rmarkdown::render(
        input = files[[i, "in.path"]],
        output_file = basename(files[[i, "out.path"]]),
        output_dir = dirname(files[[i, "out.path"]]),
        output_format = rmarkdown::md_document(),
        knit_root_dir = getwd()
      ),
      error = function(e) message(e$message)
    )
  }

  Sys.sleep(1)
}
