# $MidnightBSD$
# $FreeBSD: head/net/nanomsg/Makefile 420006 2016-08-10 10:21:09Z manu $

PORTNAME=	nanomsg
PORTVERSION=	1.0.0
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Socket library that provides several common communication patterns

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	nanomsg

USES=		cmake pathfix
USE_LDCONFIG=	yes

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig/
	-${MV} ${PREFIX}/lib/pkgconfig/nanomsg.pc ${PREFIX}/libdata/pkgconfig/nanomsg.pc

.include <bsd.port.mk>
