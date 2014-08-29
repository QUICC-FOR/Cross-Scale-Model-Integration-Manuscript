manuscript: manuscript.pdf

letter: proposal_letter.pdf

manuscript.pdf: tex/manuscript.tex tex/model_integration.bib tex/model_integration.bst \
tex/discussion.tex tex/diagram.tex tex/modeling_framework.tex tex/introduction.tex \
tex/model_description.tex tex/ex1_Sampling.pdf tex/ex1_map.pdf tex/ex1_precip.pdf tex/ex2.pdf \
tex/management.pdf tex/figures.tex
	cd tex; pdflatex manuscript; bibtex manuscript; pdflatex manuscript; pdflatex manuscript
	mv tex/manuscript.pdf manuscript.pdf
	
proposal_letter.pdf: tex/proposal_letter.tex
	cd tex; xelatex proposal_letter
	mv tex/proposal_letter.pdf proposal_letter.pdf
	
clean:
	cd tex; rm -f *.aux *.log *.bbl *.blg *.loc *.gz *.cut
	
	
