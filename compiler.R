#Load packages
library(here)
source(here("code", "packages.R"))

#Define colors and chart template
source(here("code", "visual_params.R"))

#Define chart functions (shortcuts)
source(here("code", "functions.R"))

#Import the template
pp_template <- read_pptx(path = here("template.pptx"))

##### Title slide #####
slides <- add_slide(pp_template, layout = "Title Slide", master = "Frame") %>% 
  ph_with(value = "Auto-compiled presentation demo", location = ph_location_type(type = "ctrTitle")) %>% 
  ph_with(value = "All slides have been created in R", location = ph_location_type(type = "subTitle"))

##### Outline #####
slides <- add_slide(pp_template, layout = "Title and Content", master = "Frame") %>% 
  ph_with(value = "Presentation outline", location = ph_location_type(type = "title")) %>% 
  ph_with(value = c("What are the largest EU economies?",
                    "What is the current inflation in these countries?",
                    "Is economy size related to inflation?"),
          location = ph_location_type(type = "body"))

###### Slide 1: GDP of DE, FR, IT, ES, NL ######
suppressWarnings(source(here("code", "charts", "GDP.R")))

slides <- add_slide(slides, layout = "Title and Content", master = "Frame") %>% 
  ph_with(value = "Largest EU economies in 2021 (GDP; 2015 EUR million)", location = ph_location_type(type = "title")) %>% 
  ph_with(chart, location = ph_location_type(type = "body"))

###### Slide 2: inflation in DE, FR, IT, ES, NL ######
suppressWarnings(source(here("code", "charts", "inflation.R")))

slides <- add_slide(slides, layout = "Title and Content", master = "Frame") %>% 
  ph_with(value = "Inflation in the largest EU countries (%; y-o-y)", location = ph_location_type(type = "title")) %>% 
  ph_with(chart, location = ph_location_type(type = "body"))

###### Slide 3: inflation against GDP ######
suppressWarnings(source(here("code", "charts", "GDP_vs_inflation.R")))

slides <- add_slide(slides, layout = "Title and Content", master = "Frame") %>% 
  ph_with(value = "Inflation against GDP", location = ph_location_type(type = "title")) %>% 
  ph_with(chart, location = ph_location_type(type = "body"))

##### Last slide #####
slides <- add_slide(pp_template, layout = "Title Slide", master = "Frame") %>% 
  ph_with(value = "Thank you!", location = ph_location_type(type = "ctrTitle")) %>% 
  ph_with(value = "Feel free to approach me with any questions", location = ph_location_type(type = "subTitle"))

##### Save the presentation ######
print(slides, target = here("output.pptx"))
