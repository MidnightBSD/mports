# $MidnightBSD$

PORTNAME=	mport-manager
PORTVERSION=	0.1.3
CATEGORIES=	ports-mgmt sysutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Graphical Package Manager for MidnightBSD

LICENSE=	bsd2

WRKSRC=         ${WRKDIR}/${PORTNAME}-${PORTVERSION}

USES=		pkgconfig
USE_GITHUB=     yes
GH_PROJECT=     mport-manager
GH_ACCOUNT=     laffer1
GH_TAGNAME=     ${PORTVERSION}
GH_COMMIT=      b7486c0
USE_CSTD=       c99

USE_GNOME=	gtk30
WANT_GNOME=	yes

.include <bsd.port.mk>
