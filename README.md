
# pagedreport

> License statement : now CC-BY-SA !

## How it works

This is mainly three elements :

- a YAML file that setup some defaults values
- a custom HTML Pandoc template + partials (especially styles.html)
- CSS templates

Plus a documentation (below)

This all works thanks to Pandoc `pdf-engine` that includes `weasyprint` and `pagedjs-cli`.

## Parameter list

List from : https://quarto.org/docs/reference/formats/pdf.html + some changes

-> Make a list inside a table with parameter/default value/what it change/example

### Theme

Should be a true/false on the name

### Page size

- `pagesize`: also works in landscape. Default to A4. Could be one of Letter (http://test.weasyprint.org/suite-css-page-3/chapter5/section2/) or measures

Please note that size of elements aren't specifically adjusted for landscape mode so you would maybe have to change some things in the template

### Colors

- `maincolor``
- `secondcolor`
- `linkcolor`
- `fontcolor`
- `monobackgroundcolor`
- `backgroundcolor`

### Fonts

- `mainfont`: for everything. If no value this is the default system font.
- `headerfont`: for header (from `h1` to `h5`) if not specified this takes `mainfont` value
- `monofont`


### Sizes

- `fontsize`
- `linestretch`
- `maxwidth`
- `margin-left`/...

### Covers

- `logo`
- `cover`
- `abstract`: abstract

- `backcover`: color or path or false (or forget) to set or not a back cover
- `includeback`: true/false
- `backtext`; like abstract for the back

### Misc

- `toc`: table of contents



## Modify images and logo

### Darken image

Please note that you can darken your image with the `magick` package like that :

```
# read image
my_image <- magick::image_read(input_path)

# darken image
my_image_darken <- magick::image_colorize(my_image, opacity = 50, color = "black")

# write image
magick::image_write(my_image_darken, output_path, format = "jpg")
```

Then just use the new image as a parameter.

### Make logo white

In the same spirit, you can make your logo white with :

```
magick::image_colorize(my_logo, opacity = 100, color = "white")
```

## How it will evolve


