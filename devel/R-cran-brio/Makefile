PORTNAME=	brio
DISTVERSION=	1.1.5
CATEGORIES=	devel
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic R Input Output
WWW=		https://brio.r-lib.org

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cran:auto-plist,compiles

# circular depend on test
NO_TEST=	yes

.include <bsd.port.mk>
