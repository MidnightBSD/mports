PORTNAME=	processx
DISTVERSION=	3.8.6
CATEGORIES=	sysutils
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Execute and Control System Processes
WWW=		https://processx.r-lib.org

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	R-cran-ps>=1.2.0:sysutils/R-cran-ps \
		R-cran-R6>0:devel/R-cran-R6

USES=		cran:auto-plist,compiles

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/R/library/processx/bin/px
	@${STRIP_CMD} ${PREFIX}/lib/R/library/processx/bin/sock
	@${STRIP_CMD} ${PREFIX}/lib/R/library/processx/bin/supervisor
.include <bsd.port.mk>
