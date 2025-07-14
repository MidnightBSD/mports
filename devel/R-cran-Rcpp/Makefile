PORTNAME=	Rcpp
DISTVERSION=	1.0.14
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Seamless R and C++ Integration
WWW=		https://cran.r-project.org/web/packages/Rcpp/

LICENSE=	gpl2+

USES=		cran:auto-plist,compiles shebangfix
SHEBANG_FILES=	inst/examples/*/*.r inst/examples/*/*.R inst/examples/*/*.sh
SHEBANG_LANG=	r
r_OLD_CMD=	/usr/bin/r
r_CMD=		${LOCALBASE}/bin/R

.include <bsd.port.mk>
