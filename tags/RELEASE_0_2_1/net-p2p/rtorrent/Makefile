# New ports collection makefile for:	rtorrent
# Date created:				Mar 03 2005
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD: mports/net-p2p/rtorrent/Makefile,v 1.2 2007/06/07 19:19:47 ctriv Exp $
# $FreeBSD: ports/net-p2p/rtorrent/Makefile,v 1.21 2006/08/08 10:19:40 flz Exp $
#

PORTNAME?=	rtorrent
PORTVERSION?=	0.7.4
PORTREVISION?=	0
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	BitTorrent Client written in C++
LICENSE=	gpl2

BUILD_DEPENDS?=	libtorrent>=0.11.3:${PORTSDIR}/net-p2p/libtorrent
RUN_DEPENDS?=	libtorrent>=0.11.3:${PORTSDIR}/net-p2p/libtorrent
LIB_DEPENDS+=	curl.4:${PORTSDIR}/ftp/curl

CONFLICTS=	rtorrent-devel-[0-9]*

MAN1=		rtorrent.1

USE_GCC=	3.4+
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0

SUB_FILES=	pkg-message

PORTDOCS=	README

post-patch:
	@${REINPLACE_CMD} -e 's|-O3|${CFLAGS}|' ${WRKSRC}/configure

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}/
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/rtorrent.rc ${EXAMPLESDIR}/

.include <bsd.port.mk>
