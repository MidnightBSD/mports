# New ports collection makefile for:	transmission
# Date created:				08 October 2005
# Whom:					Mezz <mezz@FreeBSD.org>
#
# $MidnightBSD: mports/net-p2p/transmission/Makefile,v 1.1 2008/03/15 21:41:28 laffer1 Exp $
# $FreeBSD: ports/net-p2p/transmission/Makefile,v 1.34 2008/02/27 05:15:56 mezz Exp $
#

PORTNAME=	transmission
PORTVERSION=	1.21
CATEGORIES=	net-p2p
MASTER_SITES=	http://download.m0k.org/${PORTNAME}/files/

MAINTAINER=	ports@MIdnightBSD.org
COMMENT?=	A free BitTorrent client written from scratch in C
LICENSE=	mit

LIB_DEPENDS=    curl.4:${PORTSDIR}/ftp/curl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME?=	gnometarget intlhack
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS?=--without-gtk \
		--without-wx

CUSTOM_SUBDIRS?=third-party libtransmission cli
DOCS=		AUTHORS LICENSE NEWS README
MAN1?=		transmissioncli.1

general-patch:
	@${REINPLACE_CMD} -e \
		's|CFLAGS="-g -Wall.*"|CFLAGS="${CFLAGS} -Wall -W"|g ; \
		s|CXXFLAGS="-g -Wall.*"|CXXFLAGS="${CXXFLAGS} -Wall -W"|g ; \
		s|_pthread_flags=".*"|_pthread_flags="${PTHREAD_LIBS}"|g' \
			${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|%%CUSTOM_SUBDIRS%%|${CUSTOM_SUBDIRS}|g' \
		${WRKSRC}/Makefile.in
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
