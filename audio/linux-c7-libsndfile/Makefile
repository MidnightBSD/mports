# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	libsndfile
PORTVERSION=	1.0.25
DISTVERSIONSUFFIX=	-12.el7
PORTREVISION=	6
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reading and writing files containing sampled sound (like WAV or AIFF) (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	lgpl2.1

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	flac gsm libogg libvorbis
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
