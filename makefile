manuscript: manuscript.pdf

proposal: proposal_letter.pdf

manuscript.pdf: tex/manuscript.tex tex/model_integration.bib tex/model_integration.bst \
tex/ex1_Sampling.pdf tex/ex1_map.pdf tex/ex1_precip.pdf tex/ex2.pdf tex/management.pdf \
tex/diagram.tex tex/bibprep.pl
	cd tex; pdflatex manuscript; bibtex manuscript
	./tex/bibprep.pl ./tex/manuscript.bbl
	cd tex; pdflatex manuscript; pdflatex manuscript
	mv tex/manuscript.pdf manuscript.pdf
	
proposal_letter.pdf: tex/proposal_letter.tex tex/uqar-logo2.pdf
	cd tex; xelatex proposal_letter
	mv tex/proposal_letter.pdf proposal_letter.pdf
	
clean:
	cd tex; rm -f *.aux *.log *.bbl *.blg *.loc *.gz *.cut
	
wordcounts: tex/manuscript.tex
	cd tex; texcount -sub=none manuscript.tex | perl -ne 'print if s/(\d+)\+.+(abstract|manuscript|box 1|fig \d)/$$2: $$1/'
	cd tex; texcount -sub=none proposal_letter.tex | perl -ne 'print if s/(\d+)\+.+(body|opening|closing)/Proposal Letter $$2: $$1/'
