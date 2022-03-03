import Statistics
import Graphs

include("STOCK.jl")

# 1. compute stock price daily changes
X = STOCK.Closes - STOCK.Opens

# 2. compute *squared* correlation matrix
Xcorr = Statistics.cor(X).^2

# 3. compute *maximum* spanning tree
edges = Graphs.kruskal_mst(Graphs.SimpleGraphs.complete_graph(size(Xcorr, 1)), Xcorr, minimize=false)
T = Graphs.SimpleGraphFromIterator(edges)

# 4. write a graphviz file for the graph, see Makefile for generating the pdf figure
open("stocks.graphviz", "w") do file
  write(file, "graph G {\n")

  for (i, name) in enumerate(STOCK.names)
    write(file, "\t\"$(name)\" [style=filled fillcolor=$(STOCK.colors[STOCK.industries[i]])];\n")
  end

  for (i, pa) in enumerate(Graphs.dfs_tree(T, 1).badjlist)
    for p in pa
      write(file, "\t\"$(STOCK.names[i])\" -- \"$(STOCK.names[p])\";\n")
    end
  end
  write(file, "}")
end
