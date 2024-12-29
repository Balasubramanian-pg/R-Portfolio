# Detailed Documentation for Florida Population Visualization Code

## Overview
This R script visualizes the population density of Florida using geospatial and raster data. It leverages libraries such as `sf`, `rayshader`, and `MetBrewer` to create a 3D map.

---

## Libraries Used
The script uses the following libraries:

- `sf`: For handling spatial vector data.
- `tigris`: For fetching US states' shapefiles.
- `tidyverse`: For data manipulation and visualization.
- `stars`: For raster manipulation.
- `rayshader`: For 3D visualization.
- `MetBrewer`: For creating aesthetically pleasing color palettes.
- `colorspace`: For color palette visualization.

---

## Step-by-Step Explanation

### 1. Load Population Data

```r
data <- st_read("data/kontur_population_US_20220630.gpkg")

    Purpose: Load geospatial data representing population density across the US.
    File Format: Geopackage (.gpkg).

2. Load and Filter State Data

st <- states()
florida <- st |> 
  filter(NAME == "Florida") |> 
  st_transform(crs = st_crs(data))

    Purpose: Load US state boundaries and filter for Florida.
    Transformation: Ensures coordinate systems match the population data.

3. Verify Florida Geometry

florida |> 
  ggplot() +
  geom_sf()

    Purpose: Visualize Florida's boundaries for confirmation.

4. Intersect Population Data with Florida

st_florida <- st_intersection(data, florida)

    Purpose: Restrict population data to Florida's boundaries using a geometric intersection.

5. Define Aspect Ratio
a. Compute Bounding Box

bb <- st_bbox(st_florida)

    Purpose: Get the spatial extent of the Florida population data.

b. Identify Key Points

bottom_left <- st_point(c(bb[["xmin"]], bb[["ymin"]])) |> 
  st_sfc(crs = st_crs(data))

bottom_right <- st_point(c(bb[["xmax"]], bb[["ymin"]])) |> 
  st_sfc(crs = st_crs(data))

    Purpose: Define the bottom-left and bottom-right corners of the bounding box.

c. Calculate Dimensions

width <- st_distance(bottom_left, bottom_right)
top_left <- st_point(c(bb[["xmin"]], bb[["ymax"]])) |> 
  st_sfc(crs = st_crs(data))
height <- st_distance(bottom_left, top_left)

    Purpose: Compute width and height for aspect ratio.

d. Set Ratios

if (width > height) {
  w_ratio <- 1
  h_ratio <- height / width
} else {
  h_ratio <- 1
  w_ratio <- width / height
}

    Purpose: Normalize the dimensions for rasterization.

6. Rasterize and Convert to Matrix

size <- 5000
florida_rast <- st_rasterize(st_florida, 
                             nx = floor(size * w_ratio),
                             ny = floor(size * h_ratio))

mat <- matrix(florida_rast$population, 
              nrow = floor(size * w_ratio),
              ncol = floor(size * h_ratio))

    Purpose: Rasterize Florida population data and convert it to a matrix for rayshader.

7. Create Color Palette

c1 <- met.brewer("OKeeffe2")
texture <- grDevices::colorRampPalette(c1, bias = 2)(256)

    Purpose: Generate a color palette inspired by art for visual aesthetics.

8. Render 3D Map
a. Generate 3D Plot

mat |> 
  height_shade(texture = texture) |> 
  plot_3d(heightmap = mat,
          zscale = 100 / 5,
          solid = FALSE,
          shadowdepth = 0)
render_camera(theta = -20, phi = 45, zoom = .8)

    Purpose: Render a 3D visualization of the Florida population density.

b. Save High-Quality Image

outfile <- "images/final_plot.png"
render_highquality(
    filename = outfile,
    interactive = FALSE,
    lightdirection = 280,
    lightaltitude = c(20, 80),
    lightcolor = c(c1[2], "white"),
    lightintensity = c(600, 100),
    samples = 450,
    width = 6000,
    height = 6000
)

    Purpose: Save the visualization as a high-resolution PNG file.

Outputs

    Florida Boundary Plot: Confirms accurate spatial filtering.
    3D Population Visualization: A rendered map showing population density in Florida.
    High-Quality PNG: Exported for presentation or publication.

Notes

    Ensure input files exist in the specified paths.
    Adjust size for different resolutions.
    Use the MetBrewer palette to experiment with different aesthetics.
