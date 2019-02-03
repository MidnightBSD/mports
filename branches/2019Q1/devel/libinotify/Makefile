# $MidnightBSD$

PORTNAME=	libinotify
PORTVERSION=	20160505
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kevent based inotify compatible library

LICENSE=	mit

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	libinotify-kqueue
GH_PROJECT=	libinotify-kqueue
GH_TAGNAME=	417e789

WRKSRC=		${WRKDIR}/libinotify-kqueue-${GH_TAGNAME}

USES=		autoreconf libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
