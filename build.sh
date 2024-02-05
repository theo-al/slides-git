# script adaptado de https://ashwinschronicles.github.io/beamer-slides-using-markdown-and-pandoc

pandoc \
	-f gfm -s tutorial-git.md  -t revealjs -o tutorial.html \
	--slide-level 2 --variable theme=night \
	--metadata title="tutorial de git" \
	--metadata author="@theo-al, @arthuraguiar032"

# alternativas
# pandoc tutorial-git.md -o tutorial.pdf
# pandoc tutorial-git.md -o tutorial.pptx

## pandoc -t beamer --from=gfm tutorial-git.md -V theme:Warsaw -o tutorial.pdf --pdf-engine pdflatex # não consegui
