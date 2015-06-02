# $MidnightBSD$

PORTNAME=	alsa-plugins-oss
PORTVERSION=	1.0.21
PORTREVISION=	4
CATEGORIES=	audio linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OSS plugin for ALSA (Linux Fedora 10)
LICENSE=	unknown

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	alsalib

RPMVERSION=	3.fc10
SRC_DISTFILES=	${PORTNAME:S/-oss//}-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}
USE_LDCONFIG=	yes

# We will use native configuration file, so delete a linux one
post-extract:
	@${RM} -r ${WRKSRC}/etc

.include <bsd.port.mk>
