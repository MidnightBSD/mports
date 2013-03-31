# $MidnightBSD: mports/textproc/asciidoc/Makefile,v 1.3 2010/10/17 00:18:31 laffer1 Exp $

PORTNAME=	asciidoc
PORTVERSION=	8.6.8
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A text document format for writing short documents and man pages
LICENSE=	gpl2

MAKE_ENV=	INSTALL="${INSTALL}" INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_SCRIPT="${INSTALL_SCRIPT}" INSTALL_DATA="${INSTALL_DATA}"

USE_PYTHON=	2.5+
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

MAN1=		a2x.1 asciidoc.1

CONFFILES=	asciidoc.conf docbook45.conf \
		filters/code/code-filter.conf \
		filters/graphviz/graphviz-filter.conf \
		filters/latex/latex-filter.conf \
		filters/music/music-filter.conf \
		filters/source/source-highlight-filter.conf \
		help.conf html4.conf html5.conf \
		lang-de.conf lang-el.conf lang-en.conf lang-es.conf \
		lang-fr.conf lang-hu.conf lang-it.conf lang-nl.conf \
		lang-pt-BR.conf lang-ru.conf lang-uk.conf \
		latex.conf slidy.conf text.conf wordpress.conf \
		xhtml11.conf xhtml11-quirks.conf

post-patch:
.for f in ${CONFFILES}
	@cd ${WRKSRC} && ${MV} ${f} ${f}.sample
.endfor

post-install:
.for f in ${CONFFILES}
	@if [ ! -f ${ETCDIR}/${f} ]; then \
		${CP} -p ${ETCDIR}/${f}.sample ${ETCDIR}/${f} ; \
	fi
.endfor

.include <bsd.port.mk>
