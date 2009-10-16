# New ports collection makefile for:    libdvdnav
# Date created:         21 May 2002
# Whom:                 MANTANI Nobutaka <nobutaka@nobutaka.com>
#
# $MidnightBSD: mports/multimedia/libdvdnav/Makefile,v 1.3 2009/09/20 01:43:36 laffer1 Exp $
# $FreeBSD: ports/multimedia/libdvdnav/Makefile,v 1.26 2007/09/30 04:47:08 linimon Exp $
#

PORTNAME=	libdvdnav
PORTVERSION=	0.1.10
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	dvd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The library for the xine-dvdnav plugin
LICENSE=	gpl2

LIB_DEPENDS=	dvdread.4:${PORTSDIR}/multimedia/libdvdread

CONFIGURE_ENV=	THREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		THREAD_LIBS="${PTHREAD_LIBS}"
CONFIGURE_ARGS=	--program-transform-name=''
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22 autoconf:261 automake:16
GNU_CONFIGURE=	yes

post-patch:
	${REINPLACE_CMD} -e \
		's|THREAD_LIBS="[^"]*"$$|THREAD_LIBS="\$$THREAD_LIBS"|g ; \
		 s|THREAD_CFLAGS=.*$$|THREAD_CFLAGS="\$$THREAD_CFLAGS"|g ; \
		 s|-L/usr/local/lib|-L${LOCALBASE}/lib|g ; \
		 s|-I/usr/local/include|-I${LOCALBASE}/include|g' \
		 ${WRKSRC}/configure ${WRKSRC}/configure.ac \
		 ${WRKSRC}/missing ${WRKSRC}/aclocal.m4 ${WRKSRC}/autogen.sh

post-configure:
	${REINPLACE_CMD} -e 's|automake[0-9][0-9]|${TRUE}|' \
		`${FIND} ${WRKSRC} -type f -name Makefile`

.include <bsd.port.mk>
