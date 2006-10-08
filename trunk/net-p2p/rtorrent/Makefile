# New ports collection makefile for:	rtorrent
# Date created:				Mar 03 2005
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/net-p2p/rtorrent/Makefile,v 1.21 2006/08/08 10:19:40 flz Exp $
#

PORTNAME?=	rtorrent
PORTVERSION?=	0.5.3
PORTREVISION?=	1
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	BitTorrent Client written in C++

LIB_DEPENDS?=	torrent.7:${PORTSDIR}/net-p2p/libtorrent
LIB_DEPENDS+=	curl.3:${PORTSDIR}/ftp/curl

CONFLICTS=	rtorrent-devel-[0-9]*

MAN1=		rtorrent.1

USE_GCC=	3.4
USE_GETOPT_LONG=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

SUB_FILES=	pkg-message

PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} -e 's|-O3|${CFLAGS}|' ${WRKSRC}/configure

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}/
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/rtorrent.rc ${EXAMPLESDIR}/
	${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
