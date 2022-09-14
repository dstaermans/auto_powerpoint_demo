###### Load data #####

# Download from Eurostat
data <- get_eurostat("prc_hicp_manr",
                     filters = list(geo = c("DE", "FR", "IT", "ES", "NL"),
                                    coicop = "CP00",
                                    lastTimePeriod = 36),
                     time_format = "date_last")

#Remove redundant columns
data <- data %>% 
  select(geo, time, values)

#Replace country codes to names
data <- data %>% 
  mutate(geo = countrycode(sourcevar = geo, origin = "eurostat", destination = "country.name"))

##### Create a chart #####

#Creating a chart object
chart <- create_pp_linechart(data, x = "time", y = "values", group = "geo", groupcolors = c("Germany" = blue,
                                                                                            "France" = gold,
                                                                                            "Italy" = green,
                                                                                            "Spain" = orange,
                                                                                            "Netherlands" = teal))

#Preview
#print(chart, preview = T)
