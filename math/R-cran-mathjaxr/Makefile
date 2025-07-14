PORTNAME=	mathjaxr
DISTVERSION=	1.8-0
CATEGORIES=	math
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Using 'Mathjax' in Rd Files
WWW=		https://cran.r-project.org/web/packages/mathjaxr/

LICENSE=	gpl3+

USES=		cran:auto-plist,compiles

post-install:
	${ECHO} "@dir lib/R/library/mathjaxr/libs" >>${TMPPLIST}

.include <bsd.port.mk>
