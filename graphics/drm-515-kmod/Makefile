PORTNAME=	drm-515-kmod
PORTVERSION=	${DRM_KMOD_DISTVERSION}
PORTREVISION=	10
CATEGORIES=	graphics

.include "Makefile.version"

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DRM drivers modules
WWW=		https://github.com/freebsd/drm-kmod/

LICENSE=	bsd2 mit gpl2
LICENSE_COMB=	multi

FAKE_OPTS=	trueprefix

CONFLICTS_INSTALL=	drm-510-kmod \
			drm-61-kmod

USES=		kmod uidfix compiler:c++11-lang

USE_GITHUB=	yes
GH_ACCOUNT=	freebsd
GH_PROJECT=	drm-kmod
GH_TAGNAME=	${DRM_KMOD_GH_TAGNAME}

.include <bsd.mport.options.mk>

IGNORE_MidnightBSD_4.0=	Needs 4.1 or higher
IGNORE_MidnightBSD_3.2=	Needs 4.1 or higher
IGNORE_MidnightBSD_3.1=	Needs 4.1 or higher

.if ${ARCH} == "amd64"
PLIST_SUB+=	AMDGPU=""
PLIST_SUB+=	I915=""
.elif ${ARCH} == "i386"
PLIST_SUB+=	AMDGPU="@comment "
PLIST_SUB+=	I915=""
.elif ${ARCH} == "aarch64" || ${ARCH:Mpowerpc*}
PLIST_SUB+=	AMDGPU=""
PLIST_SUB+=	I915="@comment "
.else
PLIST_SUB+=	AMDGPU="@comment "
PLIST_SUB+=	I915="@comment "
.endif

MAKE_ENV+=	MAKEOBJDIRPREFIX=${WRKSRC}/obj

pre-build:
		${MKDIR} ${WRKSRC}/obj
		(cd ${WRKSRC} ; ${SETENV} ${MAKE_ENV} ${MAKE_CMD} obj)

.include <bsd.port.mk>
