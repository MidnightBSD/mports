PORTNAME=	litedown
DISTVERSION=	0.7
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight Version of R Markdown
WWW=		https://cran.r-project.org/package=litedown

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	R-cran-commonmark>=1.9.5:textproc/R-cran-commonmark \
		R-cran-xfun>=0.52:misc/R-cran-xfun
TEST_DEPENDS=	R-cran-rbibutils>0:textproc/R-cran-rbibutils \
		R-cran-rstudioapi>0:devel/R-cran-rstudioapi \
		R-cran-tinytex>0:print/R-cran-tinytex

USES=		cran:auto-plist

do-test:
	@${FIND} ${WRKSRC} \( -name '*.o' -o -name '*.so' \) -delete
	@cd ${WRKDIR} ; ${SETENV} ${MAKE_ENV} _R_CHECK_FORCE_SUGGESTS_=FALSE \
	${LOCALBASE}/bin/R CMD check --no-manual ${PORTNAME}

.include <bsd.port.mk>
