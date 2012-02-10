# New ports collection makefile for:	GeoIP
# Date created:				May 17 2008
# Whom:	      				Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/net/GeoIP/Makefile,v 1.7 2011/12/15 00:57:52 laffer1 Exp $
#

PORTNAME=	GeoIP
PORTVERSION=	1.4.8
PORTREVISION=	0
CATEGORIES=	net geography
MASTER_SITES=	http://geolite.maxmind.com/download/geoip/api/c/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find the country that any IP address or hostname originates from
LICENSE=	gpl2
# lgpl 2.1 but has a few gpl2 files

CONFIGURE_ARGS=	CC="${CC}" PATH="${PATH}" \
			CFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

MAN1=		geoiplookup.1 geoipupdate.1 geoiplookup6.1

run-autotools:
	@${REINPLACE_CMD} -e '/^LIBTOOL=/s^\$$(top_builddir)/libtool^${LIBTOOL}^g' \
	${WRKSRC}/aclocal.m4

post-install:
	${INSTALL_SCRIPT} ${FILESDIR}/geoipupdate.sh ${PREFIX}/bin/

.include <bsd.port.mk>
