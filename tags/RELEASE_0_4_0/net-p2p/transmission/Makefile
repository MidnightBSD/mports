# $MidnightBSD: mports/net-p2p/transmission/Makefile,v 1.6 2010/09/07 23:38:44 laffer1 Exp $

PORTNAME=	transmission
PORTVERSION=	1.21
PORTREVISION=	3
CATEGORIES=	net-p2p
MASTER_SITES=	http://download.m0k.org/${PORTNAME}/files/

MAINTAINER=	ports@MIdnightBSD.org
COMMENT=	A free BitTorrent client written from scratch in C
LICENSE=	mit

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME?=	 intlhack pkgconfig
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS=-L${LOCALBASE}/lib
CONFIGURE_ARGS?=${GCONFIGURE} \
		--enable-cli \
		--disable-daemon \
		--disable-gtk

# General configure
GCONFIGURE=	--disable-beos \
		--disable-darwin \
		--disable-wx

DOCS=		AUTHORS LICENSE NEWS README
MAN1?=		transmissioncli.1

general-patch:
	@${REINPLACE_CMD} -e \
		's|CFLAGS="-g -Wall.*"|CFLAGS="${CFLAGS} -Wall -W"|g ; \
		s|CXXFLAGS="-g -Wall.*"|CXXFLAGS="${CXXFLAGS} -Wall -W"|g ; \
		s|_pthread_flags=".*"|_pthread_flags="${PTHREAD_LIBS}"|g' \
			${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|bin_PROGRAMS = benc2php.*|bin_PROGRAMS = |g' \
		${WRKSRC}/libtransmission/Makefile.in
	@${REINPLACE_CMD} -e 's|-lrt||g' \
		${WRKSRC}/third-party/libevent/configure
	@${REINPLACE_CMD} -e 's|@SUBDIRS = . sample.*|@SUBDIRS = .|g' \
		${WRKSRC}/third-party/libevent/Makefile.in
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e \
		's|$$(OPENSSL_CFLAGS)||g ; s|$$(OPENSSL_LIBS)||g ; \
		s|noinst_PROGRAMS = |noinst_PROGRAMS = #|g'

post-patch: general-patch

general-install:
.ifndef (NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

post-install: general-install

.include <bsd.port.mk>
