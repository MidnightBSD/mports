# New ports collection makefile for:	libtorrent
# Date created:				Jan 07 2005
# Whom:					Florent Thoumie <flz@xbsd.org>
#
# $MidnightBSD: mports/net-p2p/libtorrent/Makefile,v 1.2 2007/06/07 19:12:19 ctriv Exp $
# $FreeBSD: ports/net-p2p/libtorrent/Makefile,v 1.28 2006/07/12 19:09:46 flz Exp $
#

PORTNAME?=	libtorrent
PORTVERSION?=	0.11.4
PORTREVISION?=	0
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	BitTorrent Library written in C++
LICENSE=	gpl2

LIB_DEPENDS=	sigc-2.0.0:${PORTSDIR}/devel/libsigc++20

CONFLICTS?=	libtorrent-devel-[0-9]* \
		rblibtorrent-[0-9]* \
		rblibtorrent-devel-[0-9]*

USE_AUTOTOOLS=	libtool:15
USE_GCC=	3.4+
USE_GNOME=	pkgconfig gnomehack
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0

EXTRA_PATCHES?=	${.CURDIR}/files/stable-*

OPTIONS=	KQUEUE "Use kqueue(2) support" on

.include <bsd.port.pre.mk>

.if defined(WITH_OPENSSL_BASE)
CONFIGURE_ENV+=	OPENSSL_LIBS="-L/usr/lib -ssl -crypto" OPENSSL_CFLAGS="-I/usr/include"
.endif

CONFIGURE_ARGS=	--disable-debug --with-openssl=${OPENSSLBASE}

post-patch:
	@${REINPLACE_CMD} -e 's/-O3/${CFLAGS}/' ${WRKSRC}/configure

.if !defined(WITHOUT_KQUEUE)
CONFIGURE_ARGS+=	--with-kqueue
.endif

.include <bsd.port.post.mk>
