#Line chart
create_pp_linechart <- function(data, x, y, group = NULL, showlegend = TRUE, num_fmt = "mm/yy", groupcolors) {

#Creating a chart object
chart <- data %>% 
  ms_linechart(x = x, y = y, group = group)

#Applying the theme created previously
chart <- set_theme(chart, chart_theme)

#Removing markers from the line
chart <- chart_settings(chart, style = "line")

#Turning off line smoothing (it is on by default from the previous line)
chart <- chart_data_smooth(chart, values = 0)

#Format x-axis
chart <- chart_ax_x(
  chart,
  major_tick_mark = "none",
  minor_tick_mark = "none",
  num_fmt = num_fmt,
  tick_label_pos = "low"
)

#Format y-axis
chart <- chart_ax_y(
  chart,
  major_tick_mark = "none",
  minor_tick_mark = "none"
)

#Remove labels
chart <- chart_labels(chart,
                      title = NULL,
                      xlab = NULL,
                      ylab = NULL)

#Remove the legend (if showlegend = FALSE)
if(showlegend == FALSE) {
  chart <- chart_theme(chart, legend_position = "n")
}

#Change fill color for data
chart <- chart_data_stroke(chart, values = groupcolors)

#Change line width
chart <- chart_data_line_width(chart, values = 2.25)

}

#Bar chart
create_pp_barchart <- function(data, x, y, group = NULL, showlegend = TRUE, groupcolors) {
  
  #Creating a chart object
  chart <- data %>% 
    ms_barchart(x = x, y = y, group = group)
  
  #Apply the theme created previously
  chart <- set_theme(chart, chart_theme)
  
  #Format x-axis
  chart <- chart_ax_x(
    chart,
    major_tick_mark = "none",
    minor_tick_mark = "none",
    tick_label_pos = "low",
  )
  
  #Format y-axis
  chart <- chart_ax_y(
    chart,
    major_tick_mark = "none",
    minor_tick_mark = "none"
  )
  
  #Remove labels
  chart <- chart_labels(chart,
                        title = NULL,
                        xlab = NULL,
                        ylab = NULL)
  
  #Remove the legend (if showlegend = FALSE)
  if(showlegend == FALSE) {
    chart <- chart_theme(chart, legend_position = "n")
  }
  
  #Change fill color for data
  chart <- chart_data_fill(chart, values = groupcolors) %>% 
    chart_data_stroke(values = "transparent" ) #Removes outlines for bars
  
  #Change gap width between the bars
  chart <- chart_settings(chart, gap_width = 50)
  
}
