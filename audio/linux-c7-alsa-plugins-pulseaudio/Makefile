PORTNAME=	alsa-plugins
PORTVERSION=	1.1.6
DISTVERSIONSUFFIX=	-1.el7
PORTREVISION=	1
CATEGORIES=	audio linux
PKGNAMESUFFIX=	-pulseaudio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PulseAudio plugin for ALSA (Linux CentOS ${LINUX_DIST_VER})
WWW=		https://www.alsa-project.org/

LICENSE=	gpl3

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX=	alsalib pulseaudio-libs
USE_LINUX_RPM=	yes

LIB_DISTNAMES=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSIONFULL}

CONFLICTS=	linux-c6-${PORTNAME}${PKGNAMESUFFIX}
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

post-patch:
	@${LN} -sf ../../../usr/share/alsa/alsa.conf.d/50-pulseaudio.conf \
		${WRKSRC}/etc/alsa/conf.d

.include <bsd.port.mk>
