# $MidnightBSD$
# $FreeBSD: head/print/tex-jadetex/Makefile 392534 2015-07-19 20:33:34Z hrs $

PORTNAME=	jadetex
PORTVERSION=	3.13
CATEGORIES=	print
MASTER_SITES=	ftp://tug.org/historic/systems/texlive/2015/
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-20150523-texmf
DIST_SUBDIR=	TeX
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TeX backend for Jade, DSSSL processor for SGML/XML documents

LICENSE=	gpl2

USES=		tar:xz
USE_TEX=	texmf pdftex xmltex fmtutil
TEXHASHDIRS=	${TEXMFDISTDIR} ${TEXMFVARDIR}
EXTRACT_AFTER_ARGS=| ${TAR} -xf - -C ${STAGEDIR}${PREFIX}/share \
		--strip-components 1 --no-same-permission --no-same-owner \
		${EXTRACT_FILES:S,^,${DISTNAME}/,}
EXTRACT_FILES= \
	texmf-dist/doc/otherformats/jadetex \
	texmf-dist/source/jadetex/base \
	texmf-dist/tex/jadetex/base
NO_WRKSRC=	yes
NO_BUILD=	yes
TEX_FORMATS=	jadetex

pre-install:
	${CAT} ${DISTDIR}/${DIST_SUBDIR}/${DISTNAME}${EXTRACT_SUFX} \
	    ${EXTRACT_AFTER_ARGS}

do-install: do-texhash do-fmtutil
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/share/texmf-var/web2c/pdftex/jadetex.log \
		${PREFIX}/share/texmf-var/web2c/pdftex/pdfjadetex.log

.include <bsd.port.mk>
