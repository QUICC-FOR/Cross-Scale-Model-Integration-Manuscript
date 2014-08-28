manuscript: manuscript.pdf

manuscript.pdf: tex/manuscript.tex tex/model_integration.bib tex/model_integration.bst \
tex/discussion.tex tex/diagram.tex tex/modeling_framework.tex tex/introduction.tex \
tex/model_description.tex tex/ex1_Sampling.pdf tex/ex1_map.pdf tex/ex1_precip.pdf tex/ex2.pdf \
tex/management.pdf
	cd tex; pdflatex manuscript; bibtex manuscript; pdflatex manuscript; pdflatex manuscript
	mv tex/manuscript.pdf manuscript.pdf
	
clean:
	cd tex; rm -f *.aux *.log *.bbl *.blg *.loc *.gz *.cut
	
	
