# $MidnightBSD: mports/net-p2p/rtorrent/Makefile,v 1.6 2010/03/25 23:20:05 crash Exp $

PORTNAME?=	rtorrent
PORTVERSION?=	0.8.6
PORTREVISION=	2
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	flz/rtorrent/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	BitTorrent Client written in C++
LICENSE=	gpl2

BUILD_DEPENDS?=	libtorrent=0.12.6:${PORTSDIR}/net-p2p/libtorrent
RUN_DEPENDS?=	libtorrent=0.12.6:${PORTSDIR}/net-p2p/libtorrent
LIB_DEPENDS+=	curl.6:${PORTSDIR}/ftp/curl

CONFLICTS=	rtorrent-devel-[0-9]*

MAN1=		rtorrent.1

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0

SUB_FILES=	pkg-message

PORTDOCS=	README

OPTIONS=	XMLRPC "Compile with xmlrpc-c support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_XMLRPC)
CONFIGURE_ARGS+=	--with-xmlrpc-c
LIB_DEPENDS+=	xmlrpc.9:${PORTSDIR}/net/xmlrpc-c
.else
CONFIGURE_ARGS+=	--with-xmlrpc-c=no
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-O3|${CFLAGS}|' ${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}/
.endif
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/rtorrent.rc ${EXAMPLESDIR}/

.include <bsd.port.post.mk>
