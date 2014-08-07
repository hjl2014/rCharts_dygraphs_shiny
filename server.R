require(rCharts)
require(rChartsDygraphs)
require(shiny)
require(quantmod)


getSymbols("SPY", from = "2010-01-01")


shinyServer(function(input, output, session){
  SPY <- data.frame(Date=index(SPY), Price=SPY$SPY.Close)
  SPY$Momentum20days <- momentum(SPY$SPY.Close, 20)/lag(SPY$SPY.Close, 20)*100
   
  output$mygraph <- renderChart2({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=F, crosshair="vertical", legendFollow=TRUE,  height = NULL, width = NULL)
  })
  
  output$mygraph2 <- renderChart2({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=F, crosshair="vertical", legendFollow=TRUE, height = 400, width = 1000)
  })
  
  output$mygraph3 <- renderChart2({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=FALSE, crosshair="vertical", legendFollow=TRUE, height = 400, width = 400)
  })
})