####################################################################################################
#
# LaTeX Makefile
#
####################################################################################################

JOB_NAME = $(notdir ${PWD})

MASTER = master

TEXFILES = $(wildcard *.tex)

# FIGURES_PY = $(wildcard figures/*.py)
# FIGURES_PDF = $(patsubst %.py, %.pdf, ${FIGURES_PY})

CIRCUITS_M4 = $(wildcard figures/*.m4)
CIRCUITS_PDF = $(patsubst %.m4, %.pdf, ${CIRCUITS_M4})

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

all: pdf

# ${FIGURES_PDF}
figures: ${CIRCUITS_PDF}

pdf: ${JOB_NAME}.pdf

${JOB_NAME}.pdf: ${MASTER}.pdf
	cp ${MASTER}.pdf ${JOB_NAME}.pdf

${MASTER}.pdf: ${TEXFILES} figures
	${LATEX} ${MASTER}
#	${LATEX} ${MASTER}

####################################################################################################

# force
f:
	touch ${MASTER}.tex
	$(MAKE)	all

fast: ${TEXFILES}
	${LATEX} ${MASTER}

clean:
	-rm *.aux *.bbl *.blg *.dvi *.log *.lof *.lot *.toc *.idx *.lgpl *.nav *.out *.snm *.vrb \
	${JOB_NAME}.pdf

####################################################################################################

%.pdf : %.py
	python $^

%.pdf : %.m4
	circuit-macros-generator $^ figures

####################################################################################################

.PHONY: f all clean link

####################################################################################################
#
# End
#
####################################################################################################
