# Created by: Johannes Dieterich <jmd@FreeBSD.org>

PORTNAME=	gpu-firmware-kmod
PORTVERSION=	g20210330
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Firmware modules for the linuxkpi-based KMS components

LICENSE=	AMD INTEL
LICENSE_COMB=	multi
LICENSE_NAME_AMD=	AMD firmware license (amdgpu/radeon)
LICENSE_NAME_INTEL=	Intel firmware license (i915)
LICENSE_FILE_AMD=	${WRKSRC}/LICENSE.radeon
LICENSE_FILE_INTEL=	${WRKSRC}/LICENSE.i915
LICENSE_PERMS_AMD=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept
LICENSE_PERMS_INTEL=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

USES=		kmod uidfix

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	freebsd
GH_PROJECT=	drm-kmod-firmware
GH_TAGNAME=	df9e66d

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 200000
IGNORE=            not supported before 2.0
.endif 

post-build:
	${MKDIR} ${FAKE_DESTDIR}${KMODDIR}

.include <bsd.port.post.mk>
