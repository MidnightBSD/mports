# $MidnightBSD$

PORTNAME=	pulseaudio-libs
PORTVERSION=	0.9.14
CATEGORIES=	audio linux
MASTER_SITES=	FREEBSD_LOCAL
MASTER_SITE_SUBDIR=	netchild/rpms/${LINUX_DIST}${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for PulseAudio clients (Linux Fedora 10)

LICENSE=	gpl2

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	libasyncns xorglibs

RPMVERSION=	4.fc10
SRC_DISTFILES=	${PORTNAME:S/-libs//}-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}
USE_LDCONFIG=	yes

pre-patch:
	@(cd ${WRKSRC}/etc/pulse && ${MV} client.conf client.conf.sample)

post-patch:
	@${FIND} ${WRKSRC} -name "*.orig" -delete

.include <bsd.port.mk>
