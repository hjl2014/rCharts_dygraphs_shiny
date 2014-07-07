require(rCharts)
require(rChartsDygraphs)
require(shiny)
require(quantmod)


#don't think it makes a difference but have to test
renderChart_nosize <- function (expr, env = parent.frame(), quoted = FALSE) 
{
  func <- shiny::exprToFunction(expr, env, quoted)
  function() {
    rChart_ <- func()
    rChart_$params$height <= NULL
    rChart_$params$width <= NULL
    
    #cht_style <- sprintf("<style>.rChart {width: %spx; height: %spx} </style>", 
    #                     rChart_$params$width, rChart_$params$height)
    cht <- paste(capture.output(rChart_$print()), collapse = "\n")
    HTML(paste(cht, collapse = "\n"))
  }
}

getSymbols("SPY", from = "2010-01-01")


shinyServer(function(input, output, session){
  SPY <- data.frame(Date=index(SPY), Price=SPY$SPY.Close)
  SPY$Momentum20days <- momentum(SPY$SPY.Close, 20)/lag(SPY$SPY.Close, 20)*100
   
  output$mygraph <- renderChart_nosize({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=F, crosshair="vertical", legendFollow=TRUE,  height = NULL, width = NULL)
  })
  
  output$mygraph2 <- renderChart_nosize({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=F, crosshair="vertical", legendFollow=TRUE, height = 400, width = 1000)
  })
  
  output$mygraph3 <- renderChart_nosize({
    dygraph(data=SPY[,c("Date","SPY.Close")], sync=FALSE, crosshair="vertical", legendFollow=TRUE, height = 400, width = 400)
  })
})