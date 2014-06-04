require(rCharts)
require(rChartsDygraphs)
require(shiny)
require(quantmod)

shinyServer(function(input, output, session){
  getSymbols("SPY", from = "1993-01-01")
  SPY <- data.frame(Date=index(SPY), Price=SPY$SPY.Close)
  SPY$Momentum20days <- momentum(SPY$SPY.Close, 20)/lag(SPY$SPY.Close, 20)*100
   
  output$mygraph <- renderChart2({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=TRUE, crosshair="vertical", legendFollow=TRUE, width=1000)
  })
})