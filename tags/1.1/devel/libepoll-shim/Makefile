# Created by: Johannes Lundberg <johalun0@gmail.com>
# $FreeBSD: head/devel/libepoll-shim/Makefile 432404 2017-01-24 23:27:25Z bapt $
# $MidnightBSD$

PORTNAME=	libepoll-shim
PORTVERSION=	0.0.20161220
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	epoll shim implemented using kevent

LICENSE=	mit

USE_GITHUB=	yes
GH_ACCOUNT=	FreeBSDDesktop
GH_PROJECT=	epoll-shim
GH_TAGNAME=	c04b26b

WRKSRC=		${WRKDIR}/${GH_PROJECT}-${GH_TAGNAME}

USE_LDCONFIG=	yes

USES=		uidfix
MAKE_ARGS=	LIBDIR=${PREFIX}/lib INCLUDEDIR=${PREFIX}/include

post-patch:
	# -Weverything is not recognized by GCC
	@${REINPLACE_CMD} -e 's|Weverything|Wall|' ${WRKSRC}/Makefile

pre-install:
	@${MKDIR} ${PREFIX}/include/libepoll-shim/sys

.include <bsd.port.mk>
