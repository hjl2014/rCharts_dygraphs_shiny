require(shiny)
require(rCharts)
require(rChartsDygraphs)

shinyUI(fluidPage(
  titlePanel('Dygraphs Test in Shiny with rCharts'),
  mainPanel(
    chartOutput('mygraph', 'dygraph', package="rChartsDygraph", add_lib=T) 
  )
))