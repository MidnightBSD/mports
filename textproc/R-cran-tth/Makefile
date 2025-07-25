PORTNAME=	tth
DISTVERSION=	4.16-0
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	R wrappers for the tth/ttm TeX-to-HTML/MathML translators
WWW=		https://cran.r-project.org/web/packages/tth/

LICENSE=	gpl2

USES=		compiler:c++17-lang cran:auto-plist,compiles

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/R/library/tth/libs/tth
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/R/library/tth/libs/ttm

.include <bsd.port.mk>
