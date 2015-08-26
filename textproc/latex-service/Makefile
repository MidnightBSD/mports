# $MidnightBSD$

PORTNAME=	latex
PORTVERSION=	0.1
PORTREVISION=	3
CATEGORIES=	textproc gnustep
MASTER_SITES=	http://www.roard.com/latexservice/download/
PKGNAMESUFFIX=	-service${PKGNAMESUFFIX2}
DISTNAME=	LaTeXService-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LaTeX service for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-install:
	@${STRIP_CMD} ${PREFIX}/GNUstep/Local/Library/Services/LaTeX.service/LaTeX

.include <bsd.port.mk>
