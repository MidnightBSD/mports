# New ports collection makefile for:	libtorrent
# Date created:				Jan 07 2005
# Whom:					Florent Thoumie <flz@xbsd.org>
#
# $MidnightBSD: mports/net-p2p/libtorrent/Makefile,v 1.1 2006/10/08 12:01:49 wintellect Exp $
# $FreeBSD: ports/net-p2p/libtorrent/Makefile,v 1.28 2006/07/12 19:09:46 flz Exp $
#

PORTNAME?=	libtorrent
PORTVERSION?=	0.9.3
PORTREVISION?=	0
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	BitTorrent Library written in C++
LICENSE=	gpl2

LIB_DEPENDS=	sigc-2.0.0:${PORTSDIR}/devel/libsigc++20

CONFLICTS?=	libtorrent-devel-[0-9]*

USE_GCC=	3.4
USE_GNOME=	pkgconfig gnomehack
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

EXTRA_PATCHES?=	${.CURDIR}/files/stable-*

.include <bsd.port.pre.mk>

CONFIGURE_ARGS=	--disable-debug --with-openssl=${OPENSSLBASE}

post-patch:
	@${REINPLACE_CMD} -e 's/-O3/${CFLAGS}/' ${WRKSRC}/configure

.include <bsd.port.post.mk>
