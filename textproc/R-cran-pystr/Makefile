PORTNAME=	pystr
PORTREVISION=	6
DISTVERSION=	2.0.0
CATEGORIES=	textproc
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	String operations the Python way
WWW=		http://cran.r-project.org/web/pystr/

LICENSE=	NONE

BUILD_DEPENDS=	R-cran-Rcpp>=0.11.4.6:devel/R-cran-Rcpp
RUN_DEPENDS=	R-cran-Rcpp>=0.11.4.6:devel/R-cran-Rcpp

USES=		cran:auto-plist,compiles

NO_TEST=	yes

.include <bsd.port.mk>
