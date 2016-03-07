# $MidnightBSD$

PORTNAME=	rtorrent
PORTVERSION=	0.9.6
CATEGORIES=	net-p2p
MASTER_SITES=	http://rtorrent.net/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Client written in C++

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl \
		libtorrent.so:${PORTSDIR}/net-p2p/libtorrent

OPTIONS_DEFINE=	DOCS EXAMPLES IPV6 XMLRPC
OPTIONS_DEFAULT=XMLRPC
XMLRPC_DESC=	Compile with xmlrpc-c support

CONFIGURE_ARGS=	--disable-debug
GNU_CONFIGURE=	yes
LDFLAGS+=	-pthread
USES=		compiler:c++11-lang ncurses pkgconfig

PLIST_FILES=	bin/rtorrent
PORTDOCS=	README
PORTEXAMPLES=	rtorrent.rc
SUB_FILES=	pkg-message

IPV6_CONFIGURE_ENABLE=	ipv6
XMLRPC_CONFIGURE_OFF=	--with-xmlrpc-c=no
XMLRPC_CONFIGURE_ON=	--with-xmlrpc-c
XMLRPC_LIB_DEPENDS=	libxmlrpc.so:${PORTSDIR}/net/xmlrpc-c-devel

.include <bsd.mport.options.mk>

.if ${OSVERSION} >= 8000
USE_CXXSTD=	c++11
EXTRA_PATCHES+=	${FILESDIR}/extra-clang
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-O3|${CFLAGS}|' ${WRKSRC}/configure
.if ${OSVERSION} >= 8000
	@${FIND} ${WRKSRC} \( -name '*.h' -o -name '*.cc' \) -type f \
		-exec ${REINPLACE_CMD} -e 's/tr1::/std::/g' {} \; \
		-exec ${REINPLACE_CMD} -e 's/std::std::/std::/g' {} \; \
		-exec ${REINPLACE_CMD} -e '/namespace tr1/d' {} \; \
		-exec ${REINPLACE_CMD} -e '/include/s,tr1/,,' {} \;
.endif

post-install:
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}/
	${MKDIR} ${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/rtorrent.rc ${EXAMPLESDIR}/

.include <bsd.port.mk>
