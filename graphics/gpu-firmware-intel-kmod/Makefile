PORTNAME=	gpu-firmware-intel-kmod
PORTVERSION=	20230210
PORTREVISION=	0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Firmware modules for ${FLAVOR} Intel GPUs
WWW=		https://github.com/freebsd/drm-kmod-firmware

LICENSE=	INTEL
LICENSE_NAME=	Intel firmware license (i915)
LICENSE_FILE=	${WRKSRC}/LICENSE.i915
LICENSE_PERMS=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=		amd64 i386
ONLY_FOR_ARCHS_REASON=	Intel GPUs are only available on x86

PKGNAMESUFFIX=	-${FLAVOR:C/_/-/g}
FLAVORS=	skylake \
		broxton \
		kabylake \
		geminilake \
		cannonlake \
		icelake \
		elkhartlake \
		tigerlake \
		rocketlake \
		dg1 \
		alderlake

USES=		kmod uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	freebsd
GH_PROJECT=	drm-kmod-firmware
GH_TAGNAME=	20230210_5

MAKE_ENV=	KMODS="i915kmsfw"
MAKE_ENV+=	I915KMODS="${FLAVOR}"

FAKE_OPTS=	trueprefix

.include <bsd.port.pre.mk>

PLIST_SUB+=	${FLAVORS:N${FLAVOR}:@v@${v:tu}="\@comment "@}
PLIST_SUB+=	${FLAVOR:tu}=""

post-build:
	${MKDIR} ${FAKE_DESTDIR}${KMODDIR}

.include <bsd.port.post.mk>
