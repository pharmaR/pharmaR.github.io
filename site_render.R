if (!blogdown::hugo_available(version = getOption("blogdown.hugo.version"))) {
  blogdown::install_hugo(version = getOption("blogdown.hugo.version"))
}

blogdown::stop_server()
blogdown::build_site()
blogdown::serve_site()
