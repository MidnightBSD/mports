PORTNAME=	RMySQL
DISTVERSION=	0.11.1
CATEGORIES=	databases
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	R interface to the MySQL database
WWW=		https://cran.r-project.org/web/packages/RMySQL/

LICENSE=	gpl2

RUN_DEPENDS=	R-cran-DBI>=0.4:databases/R-cran-DBI

USES=		cpe cran:auto-plist,compiles mysql

CPE_VENDOR=	r-consortium

.include <bsd.port.mk>
