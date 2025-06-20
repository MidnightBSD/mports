PORTNAME=	btop
DISTVERSIONPREFIX=	v
DISTVERSION=	1.4.3
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monitor of resources
WWW=		https://github.com/aristocratos/btop

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USE_GCC=	14
USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	aristocratos

MAKE_ARGS+=	STRIP=true ADDFLAGS="${CXXFLAGS} ${LDFLAGS}" VERBOSE=true

#post-fake:
#	-${CP} ${WRKSRC}/btop.1 ${FAKE_DESTDIR}${TRUE_PREFIX}/share/man/man1/btop.1

.include <bsd.port.mk>
