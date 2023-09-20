
# pagedreport




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
