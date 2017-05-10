####################################################################################################
#
# LaTeX Makefile
#
####################################################################################################

JOB_NAME = $(notdir ${PWD})

MASTER = master
#MASTER = texte
TEXFILES = $(wildcard *.tex)
FIGURES_PY = $(wildcard figures/*.py)
FIGURES_PDF = $(patsubst %.py, %.pdf, ${FIGURES_PY})

# VPATH = parts:packages

####################################################################################################
#
# LaTeX options
#
####################################################################################################

#LATEX_COMMAND=pdflatex
LATEX_COMMAND=lualatex

#INTERACTION=
#INTERACTION=-interaction=batchmode
INTERACTION=-interaction=nonstopmode

LATEX = ${LATEX_COMMAND} ${INTERACTION}
# -jobname=${JOB_NAME}

####################################################################################################
#
# Rules
#
####################################################################################################

all: pdf figures

# force
f:
	touch ${MASTER}.tex
	$(MAKE)	all

figures: ${FIGURES_PDF}

pdf: ${JOB_NAME}.pdf

${JOB_NAME}.pdf: ${MASTER}.pdf
	cp ${MASTER}.pdf ${JOB_NAME}.pdf

#${MASTER}.pdf: ${TEXFILES} ${FIGURES_PDF}
${MASTER}.pdf: ${TEXFILES}
	${LATEX} ${MASTER}
#	${LATEX} ${MASTER}

%.pdf : %.py
	python $^

fast: ${TEXFILES}
	${LATEX} ${MASTER}

clean:
	-rm *.aux *.bbl *.blg *.dvi *.log *.lof *.lot *.toc *.idx *.lgpl *.nav *.out *.snm *.vrb \
	${JOB_NAME}.pdf

####################################################################################################

.PHONY: f all clean link

####################################################################################################
#
# End
#
####################################################################################################
