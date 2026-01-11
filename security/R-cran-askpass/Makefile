PORTNAME=	askpass
PORTVERSION=	1.2.1
CATEGORIES=	security
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Safe Password Entry for R, Git, and SSH
WWW=		https://cran.r-project.org/web/packages/askpass/

LICENSE=	mit

BUILD_DEPENDS=	R-cran-sys>=2.1:devel/R-cran-sys
RUN_DEPENDS=	R-cran-sys>=2.1:devel/R-cran-sys

USES=		cran:auto-plist,compiles

NO_TEST=	yes

.include <bsd.port.mk>
