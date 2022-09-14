###### Load data #####

# Download from Eurostat
data <- get_eurostat("nama_10_gdp",
                     filters = list(geo = c("DE", "FR", "IT", "ES", "NL"),
                                    na_item = "B1GQ",
                                    unit = "CLV15_MEUR",
                                    time = "2021"),
                     time_format = "date_last")

#Remove redundant columns
data <- data %>% 
  select(geo, time, values)

#Replace country codes to names
data <- data %>% 
  mutate(geo = countrycode(sourcevar = geo, origin = "eurostat", destination = "country.name"))

#Reorder countries from the largest to the smallest economy
data <- data %>% 
  arrange(desc(values))

##### Create a chart #####

#Creating a chart object
chart <- create_pp_barchart(data, x = "geo", y = "values", showlegend = FALSE, groupcolors = c(blue)) %>% 
  chart_ax_y(num_fmt = "#,##0")

#Preview
#print(chart, preview = T)
