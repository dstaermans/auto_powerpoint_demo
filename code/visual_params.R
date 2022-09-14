#Line and bar colors
blue <- "#40BAD2"
gold <- "#FAB900"
green <- "#90BB23"
orange <- "#EE7008"
teal <- "#1AB39F"
red <- "#D5393D"

#Other colors
light_grey <- "#D9D9D9" #Axis color
dark_grey <- "#595959" #Legend and axis text color

#Define chart theme
chart_theme <- mschart_theme(
  axis_ticks = fp_border(color = light_grey), #Color of axis
  axis_text = fp_text(font.family = "Corbel", color = dark_grey), #Color of axis text (units)
  legend_text = fp_text(font.family = "Corbel", color = dark_grey, font.size = 12), #Legend text color, size
  grid_major_line = fp_border(color = dark_grey, style = "none"), #No major grid lines
  grid_minor_line = fp_border(color = dark_grey, style = "none"), #No minor grid lines
  legend_position = "b" #Legend position
)
