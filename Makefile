repl:
	julia -L stocks.jl

stocks.graphviz: *.jl
	julia stocks.jl

stocks.pdf: stocks.graphviz
	dot stocks.graphviz -o stocks.pdf -T pdf

o: stocks.pdf
	open stocks.pdf
