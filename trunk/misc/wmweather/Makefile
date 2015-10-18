# $MidnightBSD$
# $FreeBSD: ports/misc/wmweather/Makefile,v 1.18 2006/12/13 12:41:30 roam Exp $

PORTNAME=	wmweather
PORTVERSION=	2.4.3
PORTREVISION=	4
CATEGORIES=	misc windowmaker
MASTER_SITES=	http://www.godisch.de/debian/wmweather/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WMaker dockapp which displays meteorological data for your city

LICENSE=	gpl2

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl
BUILD_DEPENDS=	xmessage:${PORTSDIR}/x11/xmessage
RUN_DEPENDS=	xmessage:${PORTSDIR}/x11/xmessage

CFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	LIBS="-L${LOCALBASE}/lib"
WRKSRC=		${WRKDIR}/${DISTNAME}/src
USE_GMAKE=	yes
USE_XORG=	xpm

MAN1=		wmweather.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmweather ${PREFIX}/bin/
	${LN} ${PREFIX}/bin/wmweather ${PREFIX}/bin/wmWeather
	${INSTALL_MAN} ${WRKSRC}/wmweather.1 ${PREFIX}/man/man1/
	${INSTALL_DATA} -m 644 ${WRKSRC}/wmweather.conf ${PREFIX}/etc/wmweather.conf.sample
	test -f ${PREFIX}/etc/wmweather.conf || ${CP} ${PREFIX}/etc/wmweather.conf.sample ${PREFIX}/etc/wmweather.conf

.include <bsd.port.mk>
