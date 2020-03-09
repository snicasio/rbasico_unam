library(DiagrammeR)

dgrm_vector <- grViz("
digraph boxes_and_circles {

  # a 'graph' statement
  graph [overlap = true, fontsize = 10]

  # several 'node' statements
  node [shape = box,
        width = 1,
        fontname = Helvetica]
  Vector; Atomico; Lista

  # several 'edge' statements
  Vector->Atomico Vector->Lista
}
")
dgrm_vector



dgrm_atomic <- grViz("
digraph boxes_and_circles {

  # a 'graph' statement
  graph [overlap = true, fontsize = 10]

  # several 'node' statements
  node [shape = box,
        width = 0.1,
        fontname = Helvetica]
  Atomico

  node [shape = circle,
        fixedsize = true,
        width = 0.8] // sets as circles
  numeric; integer; double; logical; character

  # several 'edge' statements
  Atomico->numeric Atomico->logical Atomico->character
  numeric->integer numeric->double
}
")
dgrm_atomic
