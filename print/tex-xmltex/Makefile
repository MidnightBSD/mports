# $MidnightBSD$
# $FreeBSD: head/print/tex-xmltex/Makefile 392534 2015-07-19 20:33:34Z hrs $

PORTNAME=	xmltex
PORTVERSION=	1.9
CATEGORIES=	print
MASTER_SITES=	ftp://tug.org/historic/systems/texlive/2015/
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-20150523-texmf
DIST_SUBDIR=	TeX
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Non-validating XML parser, written in TeX

LICENSE=	unknown

USES=		tar:xz
USE_TEX=	texmf pdftex fmtutil
TEXHASHDIRS=	${TEXMFDISTDIR}
EXTRACT_AFTER_ARGS=| ${TAR} -xf - -C ${PREFIX}/share \
		--strip-components 1 --no-same-permission --no-same-owner \
		${EXTRACT_FILES:S,^,${DISTNAME}/,}
EXTRACT_FILES= \
	texmf-dist/tex/xmltex \
	texmf-dist/doc/otherformats/xmltex
NO_WRKSRC=	yes
NO_BUILD=	yes
TEX_FORMATS=	xmltex

pre-install:
	${CAT} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} \
	    ${EXTRACT_AFTER_ARGS}

do-install:  do-texhash do-fmtutil

.include <bsd.port.mk>
