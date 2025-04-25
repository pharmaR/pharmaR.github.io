# R Validation Hub website

This repository is rendered at https://www.pharmar.org/

## Contributing Quick-Start

```r
library(blogdown)

if (!hugo_available(version = getOption("blogdown.hugo.version"))) {
  install_hugo(version = getOption("blogdown.hugo.version"))
}

stop_server()
build_site()
serve_site(port = 4321)
```
