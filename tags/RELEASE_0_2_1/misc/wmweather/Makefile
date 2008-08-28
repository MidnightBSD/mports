# New ports collection makefile for:	wmWeather-1.28
# Date created:		26 January 1998
# Whom:			Kris Kennaway <kkennawa@physics.adelaide.edu.au>
#
# $MidnightBSD: mports/misc/wmweather/Makefile,v 1.2 2007/03/25 01:05:35 ctriv Exp $
# $FreeBSD: ports/misc/wmweather/Makefile,v 1.18 2006/12/13 12:41:30 roam Exp $

PORTNAME=	wmweather
PORTVERSION=	2.4.3
PORTREVISION=	2
CATEGORIES=	misc windowmaker
MASTER_SITES=	http://www.godisch.de/debian/wmweather/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A WMaker dockapp which displays meteorological data for your city

LIB_DEPENDS=	curl:${PORTSDIR}/ftp/curl
BUILD_DEPENDS=	xmessage:${X_CLIENTS_PORT}
RUN_DEPENDS=	xmessage:${X_CLIENTS_PORT}

CFLAGS+=	-I${LOCALBASE}/include -I${X11BASE}/include
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	LIBS="-L${LOCALBASE}/lib -L${X11BASE}/lib"
WRKSRC=		${WRKDIR}/${DISTNAME}/src
USE_GMAKE=	yes
USE_GETOPT_LONG=yes
USE_XLIB=	yes
USE_XPM=	yes

MAN1=		wmweather.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmweather ${PREFIX}/bin/
	${LN} ${PREFIX}/bin/wmweather ${PREFIX}/bin/wmWeather
	${INSTALL_MAN} ${WRKSRC}/wmweather.1 ${PREFIX}/man/man1/
	${INSTALL_DATA} -m 644 ${WRKSRC}/wmweather.conf ${PREFIX}/etc/wmweather.conf.sample
	test -f ${PREFIX}/etc/wmweather.conf || ${CP} ${PREFIX}/etc/wmweather.conf.sample ${PREFIX}/etc/wmweather.conf

.include <bsd.port.mk>
