PORTNAME=	ps
DISTVERSION=	1.9.0
CATEGORIES=	sysutils
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	List, Query, Manipulate System Processes
WWW=		https://github.com/r-lib/ps

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cran:auto-plist,compiles

# circular reference problems
NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/R/library/ps/bin/px

.include <bsd.port.mk>
