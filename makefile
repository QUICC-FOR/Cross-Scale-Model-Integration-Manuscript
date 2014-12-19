manuscript: manuscript.pdf

manuscript.pdf: tex/manuscript.tex tex/model_integration.bib tex/model_integration.bst \
tex/ex1_Sampling.pdf tex/ex1_map.pdf tex/ex1_precip.pdf tex/ex2.pdf tex/management.pdf \
tex/diagram.tex 
	cd tex; pdflatex manuscript; bibtex manuscript; pdflatex manuscript; \
			pdflatex manuscript
	mv tex/manuscript.pdf manuscript.pdf
		
clean:
	cd tex; rm -f *.aux *.log *.bbl *.blg *.loc *.gz *.cut
	
wordcounts: tex/manuscript.tex
	cd tex; texcount -sub=none manuscript.tex | perl -ne 'print if s/(\d+)\+.+(abstract|manuscript|box 1|fig \d)/$$2: $$1/'