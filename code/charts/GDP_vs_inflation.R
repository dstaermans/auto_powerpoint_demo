###### Load data #####

# Download GDP data from Eurostat
 gdp_data <- get_eurostat("nama_10_gdp",
                     filters = list(geo = c("DE", "FR", "IT", "ES", "NL"),
                                    na_item = "B1GQ",
                                    unit = "CLV15_MEUR",
                                    lastTimePeriod = 1),
                     time_format = "date_last")

# Download inflation data from Eurostat
inflation_data <- get_eurostat("prc_hicp_manr",
                     filters = list(geo = c("DE", "FR", "IT", "ES", "NL"),
                                    coicop = "CP00",
                                    lastTimePeriod = 1),
                     time_format = "date_last")


#Remove redundant columns, join tables
data <- inflation_data %>% 
  select(geo, values) %>% 
  rename(last_inflation = values) %>% 
  left_join(gdp_data %>% 
              select(geo, values) %>% 
              rename(last_gdp = values),
            by = "geo")

#Replace country codes to names
data <- data %>% 
  mutate(geo = countrycode(sourcevar = geo, origin = "eurostat", destination = "country.name"))

#Remove objects not used further
rm(inflation_data, gdp_data)

##### Create a chart #####

#Creating a chart object
chart <- create_pp_scatter(data, x = "last_gdp", y = "last_inflation",
                           showlegend = FALSE,
                           groupcolors = c(blue),
                           xlab = "Latest GDP value (2015 EUR million)",
                           ylab = "Latest CPI value (%%; y-o-y)" ) %>% 
  chart_ax_x(num_fmt = "#,##0")

#Preview
#print(chart, preview = T)
