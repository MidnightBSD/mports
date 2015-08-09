# $MidnightBSD$

PORTNAME=	rtorrent
PORTVERSION=	0.9.4
PORTREVISION=	0
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Client written in C++

LICENSE=	gpl2 # or later
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl \
		libtorrent.so.18:${PORTSDIR}/net-p2p/libtorrent

GNU_CONFIGURE=	yes
USES=		pkgconfig
LDFLAGS+=	-pthread
CONFIGURE_ARGS=	--disable-debug

SUB_FILES=	pkg-message

PORTDOCS=	README

OPTIONS_DEFINE=	XMLRPC IPV6 DOCS EXAMPLES
OPTIONS_DEFAULT=XMLRPC
XMLRPC_DESC=	Compile with xmlrpc-c support
IPV6_CONFIGURE_ON=	--enable-ipv6
XMLRPC_LIB_DEPENDS=	libxmlrpc.so:${PORTSDIR}/net/xmlrpc-c-devel
XMLRPC_CONFIGURE_ON=	--with-xmlrpc-c
XMLRPC_CONFIGURE_OFF=	--with-xmlrpc-c=no

.include <bsd.mport.options.mk>

.include <bsd.port.pre.mk>

USES+=	compiler:c++11-lang

post-patch:
	@${REINPLACE_CMD} -e 's|-O3|${CFLAGS}|' ${WRKSRC}/configure

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/rtorrent.rc ${EXAMPLESDIR}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}

.include <bsd.port.post.mk>
