PORTNAME=	alsa-plugins
PORTVERSION=	1.2.7.1
DISTVERSIONSUFFIX=	-1.el9
PORTREVISION=	1
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-pulseaudio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PulseAudio plugin for ALSA (Rocky Linux ${LINUX_DIST_VER})
WWW=		https://www.alsa-project.org/

LICENSE=	gpl3

USES=		linux:rl9
USE_LDCONFIG=	yes
USE_LINUX=	alsalib pulseaudio-libs
USE_LINUX_RPM=	yes
WANT_LINUX32=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c7-${PORTNAME}${PKGNAMESUFFIX}
DESCR=		${PORTSDIR}/${PKGCATEGORY}/${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

post-patch:
	@${LN} -sf ../../../usr/share/alsa/alsa.conf.d/50-pulseaudio.conf \
		${WRKSRC}/etc/alsa/conf.d

.include <bsd.port.mk>
