# $MidnightBSD: mports/devel/libev/Makefile,v 1.2 2011/07/16 15:30:17 laffer1 Exp $

PORTNAME=	libev
PORTVERSION=	4.04
CATEGORIES=	devel
MASTER_SITES=	http://dist.schmorp.de/libev/ \
		http://dist.schmorp.de/libev/Attic/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A full-featured and high-performance event loop library
LICENSE=	bsd2

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	pkgconfig

MAN3=		ev.3

PKGCONFIGDIR?=	${PREFIX}/libdata/pkgconfig

post-patch:
	@${SED} -e 's|%PREFIX%|${PREFIX}|g ; s|%VERSION%|${PORTVERSION}|g' \
		${FILESDIR}/libev.pc.in > ${WRKDIR}/libev.pc

post-install:
	@${INSTALL_DATA} ${WRKDIR}/libev.pc ${PKGCONFIGDIR}/

.include <bsd.port.mk>
