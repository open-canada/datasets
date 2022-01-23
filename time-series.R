
# reshape input data ----
library(data.table)
library(stringr)
dt <- fread("statcan/13100810-after-20190901.csv")
dt_fitered <- dt[`Cause of death (ICD-10)`=='Total, all causes of death [A00-Y89]',nomatch=0] #one varaible, there are 18...
dt_fitered <- dt_fitered[GEO=="Canada",nomatch=0] #filter a specific region 
names(dt_fitered) = str_to_title(names(dt)) #rename columns

# to-do: remove constant columns
# to-do: when we split plot by each 'category', will the category always be province?
# to-do: deal with varaibles that only change slightly over time (not constant)
# to-do: generalize 'annotations'
# to-do: generalize 'y' axis labels
# to-do: add a button to skip to the next variable 
# to-do: disenable 'trace' in plotly
# to-do: write a for-loop to create subplots and store plotly objects in a named list, which is passed to arugments of 'subplot'

# plotly timeseries ----
# plotly documentations: https://plotly.com/r/time-series/

ax <- list(
  title = "",
  zeroline = FALSE,
  showline = FALSE,
  showticklabels = FALSE
)


fig <- plot_ly(dt_fitered, type = 'scatter', mode = 'lines')%>%
  add_trace(x = ~Date,y = ~ Rate)%>%
  layout(showlegend = F)
options(warn = -1)

fig <- fig %>%
  layout(
    xaxis = list(zerolinecolor = '#ffff',
                 zerolinewidth = 2,
                 gridcolor = 'ffff'),
    yaxis = list(zerolinecolor = '#ffff',
                 zerolinewidth = 2,
                 gridcolor = 'ffff'),
    plot_bgcolor='transparent', width = 900)


fig

annotations = list(
  list(
    x = 0.225,
    y = 1.0,
    font = list(size = 10),
    text = "Canada: Total, all causes of death [A00-Y89]",
    xref = "paper",
    yref = "paper",
    xanchor = "center",
    yanchor = "bottom",
    showarrow = FALSE
  ))
fig <- fig %>%layout(annotations = annotations, width = 900)
options(warn = -1)
fig

# 
# fig2 <- plot_ly(stock, type = 'scatter', mode = 'lines', fill = 'tonexty')%>%
#   add_trace(x = ~Dates, y = ~AAPL, name = 'AAPL')%>%
#   layout(legend=list(title=list(text='company')), xaxis = ax, yaxis = list(range = c(0.5,2),title = '', showticklabels = FALSE))
# 
# 
# fig3 <- plot_ly(stock, type = 'scatter', mode = 'lines', fill = 'tonexty')%>%
#   add_trace(x = ~Dates, y = ~AMZN, name = 'AMZN')%>%
#   layout(legend=list(title=list(text='company')), xaxis = ax, yaxis = list(range = c(0.5,2), title = 'value'))
# 
# 
# fig4 <- plot_ly(stock, type = 'scatter', mode = 'lines', fill = 'tonexty')%>%
#   add_trace(x = ~Dates, y = ~FB, name = 'FB')%>%
#   layout(legend=list(title=list(text='company')), xaxis = ax, yaxis = list(range = c(0.5,2),title = '', showticklabels = FALSE))
# 
# 
# fig5 <- plot_ly(stock, type = 'scatter', mode = 'lines', fill = 'tonexty')%>%
#   add_trace(x = ~Dates, y = ~NFLX, name = 'NFLX')%>%
#   layout(legend=list(title=list(text='company')), xaxis = list(title = 'Date'), yaxis = list(range = c(0.5,2), title = 'value'))
# 
# 
# fig6 <- plot_ly(stock, type = 'scatter', mode = 'lines', fill = 'tonexty')%>%
#   add_trace(x = ~Dates, y = ~MSFT, name = 'MSFT')%>%
#   layout( legend=list(title=list(text='company')), yaxis = list(range = c(0.5,2) ,showticklabels = FALSE, title =''),  xaxis = list(title = 'Date'))
# 

# #https://stackoverflow.com/questions/9129673/passing-list-of-named-parameters-to-function
# fig <- subplot(fig1, #fig2, fig3, fig4, fig5, fig6,
#                nrows = 3, titleY = TRUE, titleX = TRUE) %>% layout(
#                  xaxis = list(zerolinecolor = '#ffff',
#                               zerolinewidth = 2,
#                               gridcolor = 'ffff'),
#                  yaxis = list(zerolinecolor = '#ffff',
#                               zerolinewidth = 2,
#                               gridcolor = 'ffff'),
#                  plot_bgcolor='#e5ecf6')
# annotations = list(
#   list(
#     x = 0.225,
#     y = 1.0,
#     font = list(size = 10),
#     text = "company=GOOG",
#     xref = "paper",
#     yref = "paper",
#     xanchor = "center",
#     yanchor = "bottom",
#     showarrow = FALSE
#   ),
#   list(
#     x = 0.775,
#     y = 1,
#     font = list(size = 10),
#     text = "company=AAPL",
#     xref = "paper",
#     yref = "paper",
#     xanchor = "center",
#     yanchor = "bottom",
#     showarrow = FALSE
#   ),
#   list(
#     x = 0.225,
#     y = 0.64,
#     font = list(size = 10),
#     text = "company=AMZN",
#     xref = "paper",
#     yref = "paper",
#     xanchor = "center",
#     yanchor = "bottom",
#     showarrow = FALSE
#   ),
#   list(
#     x = 0.775,
#     y = 0.64,
#     font = list(size = 10),
#     text = "company=FB",
#     xref = "paper",
#     yref = "paper",
#     xanchor = "center",
#     yanchor = "bottom",
#     showarrow = FALSE
#   ),
#   list(
#     x = 0.225,
#     y = 0.315,
#     font = list(size = 10),
#     text = "company=NFLX",
#     xref = "paper",
#     yref = "paper",
#     xanchor = "center",
#     yanchor = "bottom",
#     showarrow = FALSE
#   ),
#   list(
#     x = 0.775,
#     y = 0.315,
#     font = list(size = 10),
#     text = "company=MSFT",
#     xref = "paper",
#     yref = "paper",
#     xanchor = "center",
#     yanchor = "bottom",
#     showarrow = FALSE
#   )
# )
# 
# fig <- fig %>%layout(annotations = annotations, width = 900)
# options(warn = -1)
# fig