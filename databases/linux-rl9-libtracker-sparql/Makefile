PORTNAME=	libtracker-sparql
PORTVERSION=	3.1.2
DISTVERSIONSUFFIX=	-3.el9_1
PORTREVISION=	1
CATEGORIES=	databases linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-footprint RDF triple store with SPARQL interface (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://tracker.gnome.org/

LICENSE=	lgpl2.1+

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	icu
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

SRC_DISTFILES=	tracker-${DISTVERSIONFULL}${SRC_SUFX}:SOURCE

.include <bsd.port.mk>
