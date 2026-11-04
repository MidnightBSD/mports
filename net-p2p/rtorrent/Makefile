PORTNAME=	rtorrent
DISTVERSION=	0.16.5
CATEGORIES=	net-p2p
MASTER_SITES=	https://github.com/rakshasa/rtorrent/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Client written in C++
WWW=		https://github.com/rakshasa/rtorrent

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++17-lang ncurses pkgconfig

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libtorrent.so:net-p2p/libtorrent

OPTIONS_DEFINE=	DOCS EXAMPLES XMLRPC
OPTIONS_DEFAULT=XMLRPC
XMLRPC_DESC=	Compile with xmlrpc-c support

CONFIGURE_ARGS=	--disable-debug
GNU_CONFIGURE=	yes
LDFLAGS+=	-lexecinfo -pthread

PLIST_FILES=	bin/rtorrent \
		share/rtorrent/lua/rtorrent.lua
PORTDOCS=	README.md
PORTEXAMPLES=	rtorrent.rc
SUB_FILES=	pkg-message

XMLRPC_CONFIGURE_OFF=	--with-xmlrpc-c=no
XMLRPC_CONFIGURE_ON=	--with-xmlrpc-c
XMLRPC_LIB_DEPENDS=	libxmlrpc.so:net/xmlrpc-c

.include <bsd.mport.options.mk>

post-install:
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}/
	${MKDIR} ${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/rtorrent.rc ${EXAMPLESDIR}/

.include <bsd.port.mk>
