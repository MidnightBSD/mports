# $MidnightBSD: mports/net-p2p/libtorrent/Makefile,v 1.8 2010/03/25 23:17:47 crash Exp $

PORTNAME?=	libtorrent
PORTVERSION?=	0.12.6
PORTREVISION?=	0
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	flz/libtorrent

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	BitTorrent Library written in C++
LICENSE=	gpl2

LIB_DEPENDS=	sigc-2.0.0:${PORTSDIR}/devel/libsigc++20

CONFLICTS?=	libtorrent-devel-[0-9]* \
		rblibtorrent-[0-9]* \
		rblibtorrent-devel-[0-9]*

USE_AUTOTOOLS=	libtool
USE_GNOME=	pkgconfig gnomehack
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1

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
