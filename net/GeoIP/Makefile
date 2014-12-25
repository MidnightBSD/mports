# New ports collection makefile for:	GeoIP
# Date created:				May 17 2008
# Whom:	      				Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$
#

PORTNAME=	GeoIP
PORTVERSION=	1.6.0
PORTREVISION=	0
CATEGORIES=	net geography
MASTER_SITES=	http://geolite.maxmind.com/download/geoip/api/c/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Find the country that any IP address or hostname originates from

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

USES=		libtool pathfix
USES=	aclocal automake libtoolize autoconf
AUTOMAKE_ARGS=	--add-missing
PATHFIX_MAKEFILEIN=	Makefile.am

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

SUB_FILES=	geoipupdate.sh pkg-message

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/geoipupdate.sh ${STAGEDIR}${PREFIX}/bin
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libGeoIP.so.*
	@${MKDIR} ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
