PORTNAME=	brotli
DISTVERSION=	1.3.2
CATEGORIES=	archivers
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compression Format Optimized for the Web
WWW=		https://CRAN.R-project.org/package=brotli

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	R-cran-ggplot2>0:graphics/R-cran-ggplot2 \
		R-cran-knitr>0:print/R-cran-knitr \
		R-cran-microbenchmark>0:devel/R-cran-microbenchmark \
		R-cran-R.rsp>0:textproc/R-cran-R.rsp \
		R-cran-rmarkdown>0:textproc/R-cran-rmarkdown \
		R-cran-spelling>0:textproc/R-cran-spelling

USES=		cran:auto-plist,compiles

post-stage:
	${RMDIR} ${STAGEDIR}${PREFIX}/${R_MOD_DIR}/bin

.include <bsd.port.mk>
