# Generating a favicon .ico from .svg

```sh
magick -background transparent -density 720 logo_small.svg  -define icon:auto-resize favicon.ico
```
