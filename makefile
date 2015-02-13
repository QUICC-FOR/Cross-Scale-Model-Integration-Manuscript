manuscript: manuscript.pdf

manuscript.pdf: tex/manuscript.tex tex/model_integration.bib tex/model_integration.bst \
tex/ex1_Sampling.pdf tex/ex1_map.pdf tex/ex1_precip.pdf tex/ex2.pdf tex/management.pdf \
tex/diagram.tex 
	# the first line performs a wordcount and inserts it directly into the manuscript
	cd tex; ./wordcount.sh
	cd tex; pdflatex manuscript; bibtex manuscript; pdflatex manuscript; \
			pdflatex manuscript
	mv tex/manuscript.pdf manuscript.pdf
	
Appendix_S1.pdf: tex/appendix_s1.tex
	cd tex; pdflatex appendix_s1; pdflatex appendix_s1
	mv tex/appendix_s1.pdf Appendix_S1.pdf
		
clean:
	cd tex; rm -f *.aux *.log *.bbl *.blg *.loc *.gz *.cut .msbak
	
wordcounts: tex/manuscript.tex
	cd tex; texcount -sub=none manuscript.tex | perl -ne 'print if s/(\d+)\+.+(abstract|manuscript|figures|references|biosketch)/$$2: $$1/'