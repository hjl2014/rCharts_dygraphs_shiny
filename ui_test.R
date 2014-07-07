require(shiny)
require(rCharts)
require(rChartsDygraphs)

shinyUI(fluidPage(
  titlePanel('Dygraphs Test in Shiny with rCharts'),
    
  
      h4("12 Column with Width 400"),
      chartOutput('mygraph', 'dygraph', package="rChartsDygraphs", add_lib=T) 
#,
#  
#      h4("8 Column with Width 1000"),
#      chartOutput('mygraph2', 'dygraph', package="rChartsDygraphs", add_lib=T) 
##,
#  
#      h4("8 Column with Width 400"),
#      chartOutput('mygraph3', 'dygraph', package="rChartsDygraphs", add_lib=T) 
#
 )
  
)