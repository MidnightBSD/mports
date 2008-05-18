# New ports collection makefile for:	GeoIP
# Date created:				May 17 2008
# Whom:	      				Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$
#

PORTNAME=	GeoIP
PORTVERSION=	1.4.4
CATEGORIES=	net geography
MASTER_SITES=	http://www.maxmind.com/download/geoip/api/c/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find the country that any IP address or hostname originates from
LICENSE=	gpl2
# lgpl 2.1 but has a few gpl2 files

USE_GNOME=	gnometarget
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes

MAN1=		geoiplookup.1 geoipupdate.1

.include <bsd.port.mk>
