function(){
  tabPanel("Calculate MMI",
           # SideBar
           sidebarLayout(
             sidebarPanel(
               # 0. Progress
               h3("App Steps")
               , p("User may need to refresh screen (F5) to avoid crashing.  See instructions below.")
               , a("Calculate MMI Instructions"
                   , href = "links/3_CalculateMMI_Instructions_20230818.pdf")
               , h4("1. Load File")
               # , h5("Select file parameters")
               # , radioButtons('sep', 'Separator'
               #                ,c(Comma=',',
               #                   Semicolon=';',
               #                   Tab='\t'),
               #                ',')
               # , radioButtons('quote', 'Quote',
               #                c(None='',
               #                  'Double Quote'='"',
               #                  'Single Quote'="'"),
               #                '"')
               # , fileInput('fn_input', 'Choose file to upload',
               #             accept = c(
               #               'text/csv',
               #               'text/comma-separated-values',
               #               'text/tab-separated-values',
               #               'text/plain',
               #               '.csv',
               #               '.tsv'
               #             )
               # )##fileInput~END
               , fileInput("fn_input"
                           , label = "Choose file to upload"
                           , multiple = FALSE
                           , accept = c("text/csv"
                                        , "text/comma-separated-values"
                                        #, "text/tab-separated-values"
                                        , "text/plain"
                                        , ".csv")
               )##fileInput~END

               , h4("2. Excluded Taxa")
               , checkboxInput("ExclTaxa", "Generate Exclude Taxa Column", TRUE)
               # need to create code to use in b_Calc

               , h4("3. Calculate IBI")
               , actionButton("b_Calc", "Calculate Metric Values and Scores")
               , tags$hr()

               , h4("4. Download Results")
               # Button
               , p("Select button to download zip file with input and results.")
               , p("Check 'results_log.txt' for any warnings or messages.")
               , useShinyjs()
               , shinyjs::disabled(downloadButton("b_downloadData", "Download"))

             )##sidebarPanel~END
             , mainPanel(
               tabsetPanel(type="tabs"
                           , id = "tabs_MMIcalc_main"
                           , tabPanel("Data Import Viewer"
                                      , DT::dataTableOutput('df_import_DT')
                                      , value = "tab_MMIcalc_viewer")
                           , tabPanel("Outputs"
                                      , includeHTML("www/App_CalculateMMI_2Output.html"))
                           # , tabPanel("Instructions"
                           #            , includeHTML("www/App_CalculateMMI_1Instructions.html"))
             )##tabsetPanel~END
             )##mainPanel~END

           )##sidebarLayout~END

  )## tabPanel~END
}##FUNCTION~END
