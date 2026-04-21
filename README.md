# R Validation Hub website

This repository is rendered at https://www.pharmar.org/

## Contributing Quick-Start

For new markdown content, the easiest way to render the website is with

```sh
hugo serve
```

If you're contributing a document written in `.Rmd` or `.qmd`, you'll need
to render your documents to `.md` before they will be included. You can
either do this manually, or using a script to automatically re-render on
change.

```sh
./tools/watch.R  # optional
```
