# $MidnightBSD$
# $FreeBSD: head/print/tex-formats/Makefile 373858 2014-12-04 02:30:05Z hrs $

PORTNAME=	formats
PORTVERSION=	20140525
CATEGORIES=	print
MASTER_SITES=	#empty
PKGNAMEPREFIX=	tex-
DISTFILES=	#empty
EXTRACT_ONLY=	#empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Formats for Basic TeX engines

LICENSE=	unknown

USE_TEX=	web2c basic texmf fmtutil texhash
TEXHASHDIRS=	${TEXMFVARDIR}
TEX_FORMATS=	amstex context cslatex csplain eplain latex-bin \
		metafont mex mptopdf pdftex tex

NO_BUILD=	yes

post-extract:
	mkdir ${WRKSRC}
	mkdir ${FAKE_DESTDIR}

do-install: do-texhash do-fmtutil

.include <bsd.port.mk>
