# New ports collection makefile for:	GeoIP
# Date created:				May 17 2008
# Whom:	      				Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/net/GeoIP/Makefile,v 1.3 2009/09/20 01:37:17 laffer1 Exp $
#

PORTNAME=	GeoIP
PORTVERSION=	1.4.6
CATEGORIES=	net geography
MASTER_SITES=	http://www.maxmind.com/download/geoip/api/c/ \
		http://mirror.mcx2.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find the country that any IP address or hostname originates from
LICENSE=	gpl2
# lgpl 2.1 but has a few gpl2 files

USE_GNOME=	gnometarget
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes

MAN1=		geoiplookup.1 geoipupdate.1

post-install:
	${INSTALL_SCRIPT} ${FILESDIR}/geoipupdate.sh ${PREFIX}/bin/

.include <bsd.port.mk>
