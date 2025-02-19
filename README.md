# R Validation Hub website

## Contributing Quick-Start

```r
library(blogdown)

if (!hugo_available(version = getOption("blogdown.hugo.version"))) {
  install_hugo(version = getOption("blogdown.hugo.version"))
}

stop_server()
build_site()
serve_site()
```

