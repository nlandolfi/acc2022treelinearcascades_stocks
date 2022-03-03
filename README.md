This repository contains the dataset and code used for the stock prices numerical example in _Probabilistic Modeling Using Tree Linear Cascades_, N. C. Landolfi and S. Lall, which appeared in the proceedings of the American Control Conference, 2022.

We use Julia for the numerical experiment.
We use version 1.5.3.
To check your version run `julia --version`
We require the CSV, DataFrames and Graphs packages.
For julia and packages, see https://julialang.org.

We use the graphviz `dot` command to produce the plot.
We use graphviz version 2.44.1 (20200629.0846).
To check your version run `dot -v`
For graphviz see https://graphviz.org.

The Makefile includes all commands.
`make stocks.pdf` will run the experiment and create the figure.

Files:
 - `stocks.jl` is the main file, it loads the data, computes the tree, and writes a graphviz file.
 - `STOCK.jl` includes helpers to load the data and constants for visualization labels and colors.
 - `data/` contains the stock price data as csv files.
