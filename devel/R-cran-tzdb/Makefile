PORTNAME=	tzdb
PORTVERSION=	0.5.0
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Time Zone Database Information
WWW=		https://cran.r-project.org/web/packages/tzdb/

LICENSE=	mit

RUN_DEPENDS=	R-cran-cpp11>=0.5.2:devel/R-cran-cpp11

USES=		compiler:c++11-lang cran:auto-plist,compiles shebangfix
SHEBANG_FILES=	inst/tzdata/zoneinfo2tdf.pl

.include <bsd.port.mk>
