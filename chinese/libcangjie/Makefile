PORTNAME=	libcangjie
PORTVERSION=	1.3
PORTREVISION=	3
DISTVERSIONPREFIX=	v
CATEGORIES=	chinese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library implementing the Cangjie input method
WWW=		https://github.com/Cangjians/libcangjie

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf gmake libtool localbase pkgconfig sqlite
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	Cangjians

post-install:
	@(${STRIP_CMD} ${PREFIX}/lib/*.so)

.include <bsd.port.mk>
