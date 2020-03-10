library(DiagrammeR)

dgrm_list <- grViz("
digraph boxes_and_circles {

  # a 'graph' statement
  graph [overlap = true, fontsize = 10]

  # several 'node' statements
  node [shape = box,
        width = 1,
        height = 1,
        fontname = Helvetica]
  dataframe; tibble; Lista

  # several 'edge' statements
  Lista->dataframe
  Lista->tibble
}
")
dgrm_list


atomic_s3 <- grViz("
digraph boxes_and_circles {

  # a 'graph' statement
  graph [overlap = true, fontsize = 10]

  # several 'node' statements
  node [shape = box,
        width = 1,
        height = 1,
        fontname = Helvetica]
        Atomico

  node [shape = circle,
        fixedsize = true,
        width = 1] // sets as circles
  numeric; integer; double; logical; character
  
  node [shape = triangle,
        fixedsize = true,
        width = 1.5,
        height = 1.5] // sets as circles
  factor; POSIXct; Date; difftime

  # several 'edge' statements
  Atomico->numeric Atomico->logical Atomico->character
  numeric->integer numeric->double
  factor->integer [label = 'S3', fontname = Helvetica]
  POSIXct->double [label = 'S3', fontname = Helvetica]
  Date->double [label = 'S3', fontname = Helvetica]
  difftime->double [label = 'S3', fontname = Helvetica]
  
  # add a graph statement
  graph [nodesep = 0.2]
}
")
atomic_s3