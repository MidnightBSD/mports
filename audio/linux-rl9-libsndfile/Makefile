PORTNAME=	libsndfile
PORTVERSION=	1.0.31
DISTVERSIONSUFFIX=	-8.el9_5.2
PORTREVISION=	3
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reading and writing files containing sampled sound (like WAV or AIFF) (Rocky Linux ${LINUX_DIST_VER})
WWW=		http://www.mega-nerd.com/libsndfile/

USES=		cpe linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	flac gsm libogg libvorbis
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

CPE_VENDOR=	libsndfile_project

CONFLICTS=	linux-c7-${PORTNAME}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
