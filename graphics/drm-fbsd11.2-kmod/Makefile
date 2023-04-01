PORTNAME=	drm-fbsd11.2-kmod
PORTVERSION=	4.11g20200420
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DRM modules for the linuxkpi-based KMS components

LICENSE=	bsd2 mit gpl2
LICENSE_COMB=	multi

BROKEN_MidnightBSD_1.0=      too old
BROKEN_MidnightBSD_1.1=      too old
BROKEN_MidnightBSD_1.2=      too old
BROKEN_MidnightBSD_3.0=      too new

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	the new KMS components are only supported on amd64

RUN_DEPENDS=	gpu-firmware-kmod>=g20180319:graphics/gpu-firmware-kmod

OPTIONS_DEFINE=	DEBUG

USES=		kmod uidfix

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	FreeBSDDesktop
GH_PROJECT=	kms-drm
GH_TAGNAME=	d7d433d

.include <bsd.mport.options.mk>

post-build:
	${MKDIR} ${FAKE_DESTDIR}${KMODDIR}

.include <bsd.port.mk>
