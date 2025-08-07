# **Florida Population Density Visualization**

## **1. Project Overview**
This R script creates an **interactive 3D visualization** of population density across Florida using geospatial analysis and photorealistic rendering techniques. The workflow combines:
- **Geospatial processing** (`sf`, `tigris`)
- **Raster manipulation** (`stars`)
- **3D rendering** (`rayshader`)
- **Aesthetic color design** (`MetBrewer`)

---

## **2. Detailed Step-by-Step Explanation**

### **1. Data Loading & Preparation**
#### **Population Data Import**
```r
data <- st_read("data/kontur_population_US_20220630.gpkg")
```
- **Source**: Kontur Population Dataset (global population at ~100m resolution)
- **Format**: Geopackage (vector data with population counts per hexagonal cell)
- **CRS**: Automatically reads coordinate reference system (likely EPSG:4326 WGS84)

#### **Florida Boundary Extraction**
```r
florida <- states() |> 
  filter(NAME == "Florida") |> 
  st_transform(crs = st_crs(data))
```
- **`tigris::states()`**: Fetches US state boundaries from Census TIGER/Line
- **Reprojection**: Ensures Florida's shapefile matches population data's CRS

**Verification Plot**:
```r
ggplot(florida) + geom_sf()
```
- Validates correct geographic filtering (checks for panhandle shape)

---

### **2. Spatial Analysis**
#### **Population Data Clipping**
```r
st_florida <- st_intersection(data, florida)
```
- **Operation**: Spatial clip retaining only population cells within Florida
- **Output**: `sf` object with `population` column for intersecting hexagons

#### **Bounding Box Calculations**
```r
bb <- st_bbox(st_florida)  # Gets min/max coordinates
width <- st_distance(bottom_left, bottom_right)  # Meters/EPSG units
height <- st_distance(bottom_left, top_left)
```
- **Purpose**: Determines aspect ratio to prevent raster distortion
- **Normalization**:
  ```r
  if (width > height) {
    w_ratio <- 1
    h_ratio <- height / width
  }
  ```
  Ensures proportional dimensions during rasterization

---

### **3. Raster Conversion**
#### **Rasterization Parameters**
```r
size <- 5000  # Base resolution
florida_rast <- st_rasterize(st_florida,
                           nx = floor(size * w_ratio),
                           ny = floor(size * h_ratio))
```
- **Resolution**: ~5000x5000 pixels (adjusted by aspect ratio)
- **Method**: Assigns population values to raster cells via spatial averaging

#### **Matrix Conversion**
```r
mat <- matrix(florida_rast$population, 
             nrow = floor(size * w_ratio),
             ncol = floor(size * h_ratio))
```
- **Structure Required by rayshader**: Numeric matrix where values represent elevation (here: population density)

---

### **4. Visual Design**
#### **Color Palette Selection**
```r
c1 <- met.brewer("OKeeffe2")  # Georgia O'Keeffe inspired palette
texture <- colorRampPalette(c1, bias = 2)(256)
```
- **MetBrewer Palettes**: Artistically curated color schemes
- **Bias=2**: Increases contrast in high-density areas

**Palette Options**:
| Palette      | Style          | Best For          |
|--------------|----------------|-------------------|
| `OKeeffe2`   | Earth tones    | Natural features  |
| `VanGogh3`   | Vibrant blues  | Water emphasis    |
| `Degas`      | Pastels        | Subtle gradients  |

---

### **5. 3D Rendering**
#### **Base 3D Scene**
```r
mat |> 
  height_shade(texture = texture) |> 
  plot_3d(heightmap = mat,
         zscale = 100 / 5,  # Vertical exaggeration
         solid = FALSE,      # Transparent base
         shadowdepth = 0)    # Shadow control
```
- **zscale**: 20:1 vertical exaggeration (100m elevation per 5 people/km²)
- **solid=FALSE**: Creates "floating" effect without solid base

#### **Camera Positioning**
```r
render_camera(theta = -20, phi = 45, zoom = .8)
```
- **theta**: Rotation angle (azimuth)
- **phi**: Inclination (elevation)
- **zoom**: Framing adjustment

---

### **6. High-Quality Output**
#### **Lighting Configuration**
```r
render_highquality(
  lightdirection = 280,      # NW lighting
  lightaltitude = c(20,80),  # Low + high angle lights
  lightcolor = c(c1[2], "white"),  # Warm fill + white key
  lightintensity = c(600,100)      # Strong vs ambient
)
```
- **Multi-light setup**: Creates depth through shadows
- **Physically Based Rendering (PBR)**: Simulates realistic materials

#### **Output Specifications**
```r
samples = 450,        # Ray tracing samples (anti-aliasing)
width = 6000,         # 6K resolution
height = 6000,
filename = "images/final_plot.png"
```
- **File Size**: ~15-20MB PNG (uncompressed)
- **Render Time**: ~15-30 mins on modern GPU

---

## **3. Advanced Customization Options**

### **Alternative Visualization Approaches**
1. **Interactive HTML**
   ```r
   render_webgl()  # Creates zoomable 3D in browser
   ```

2. **Animated Rotation**
   ```r
   render_movie(filename = "florida.mp4", fps = 30)
   ```

3. **Population Decile Mapping**
   ```r
   mat |> 
     mutate(pop_cut = cut(population, breaks = quantile(population, probs = seq(0,1,.1)))) |> 
     plot_3d()
   ```

### **Performance Optimization**
- **For large datasets**:
  ```r
  options(rayshader.progress = FALSE)  # Disable progress bars
  set.seed(123)  # Consistent sampling
  ```

---

## **4. Expected Outputs**
| File                | Description                          | Use Case                  |
|---------------------|--------------------------------------|---------------------------|
| `final_plot.png`    | 6K resolution render                 | Publications, presentations |
| `florida_boundary.png` | Verification plot                 | Debugging                 |
| `raster_matrix.rds` | Saved matrix for re-rendering        | Iterative design          |

---

## **5. Troubleshooting Guide**
| Issue               | Solution                             |
|---------------------|--------------------------------------|
| CRS mismatch        | `st_transform()` to EPSG:4326        |
| Missing land areas  | Check `st_intersection()` validity   |
| Low render quality  | Increase `samples` to 800+           |
| Memory errors       | Reduce `size` parameter              |

---

## **6. Further Development**
1. **Comparative Analysis**
   ```r
   # Compare with nighttime lights data
   rasters <- terra::rast(c(pop_raster, lights_raster))
   ```

2. **Machine Learning Integration**
   ```r
   # Predict population from satellite imagery
   model <- train(population ~ ., data = raster_to_df(mat))
   ```

3. **Shiny Dashboard**
   ```r
   shiny::renderPlot({ plot_3d(react_matrix()) })
   ```

This expanded workflow enables **scientific-grade geospatial visualization** suitable for urban planning, disaster preparedness, and demographic research. Would you like me to elaborate on any specific component?
