PORTNAME=	bit64
DISTVERSION=	4.6.0-1
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S3 Class for Vectors of 64bit Integers
WWW=		https://cran.r-project.org/web/packages/bit64/

LICENSE=	gpl2+

NO_TEST=	yes

BUILD_DEPENDS=	R-cran-bit>=4.0.0:devel/R-cran-bit
RUN_DEPENDS=	R-cran-bit>=4.0.0:devel/R-cran-bit

USES=		cran:auto-plist,compiles

.include <bsd.port.mk>
