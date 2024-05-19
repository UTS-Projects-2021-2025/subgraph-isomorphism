.PHONY: inter clean purge

NAME = subgraph_iso_note
SRC = $(NAME).tex
OUT = $(NAME).pdf
INTER = $(NAME).aux $(NAME).out
COMPILER = tectonic -X compile --synctex

$(OUT): $(SRC)
	$(COMPILER) $(SRC)

$(INTER): $(SRC)
	$(COMPILER) --keep-intermediates $(SRC)

inter: $(INTER)

watch:
	watchexec -e tex $(COMPILER) $(SRC)

clean:
	rm -rf *.aux *.log *.out *.prv *.bbl *.toc

purge: clean
	rm -f *.synctex.gz *.pdf
