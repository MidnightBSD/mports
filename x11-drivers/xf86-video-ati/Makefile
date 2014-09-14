# $MidnightBSD$

PORTNAME=	xf86-video-ati
PORTVERSION=	${ATI_VERSION}
PORTREVISION=	${ATI_REVISION}
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org ati display driver

LICENSE=	mit

USE_GL=		gl
XORG_CAT=	driver
USE_XORG=	xf86driproto xineramaproto xf86miscproto glproto

.include <bsd.mport.options.mk>

.if (${OSVERSION} >= 6000)
. if defined(WITH_NEW_XORG)
NEW_ATI_DRIVER=	yes
. else
NEW_ATI_DRIVER=	no
. endif
.else
. if defined(FORCE_KMS_ONLY_DDX)
NEW_ATI_DRIVER=	yes
. else
NEW_ATI_DRIVER=	no
. endif
.endif

.if ${NEW_ATI_DRIVER} == no
ATI_VERSION=	6.14.6
ATI_REVISION=	4
CONFIGURE_ARGS+=--disable-kms
PLIST_SUB+=	OLD=""
.else
ATI_VERSION=	7.2.0
ATI_REVISION=	4
CONFIGURE_ARGS+=--disable-udev
CONFIGURE_ARGS+=--disable-glamor
EXTRA_PATCHES+=	${FILESDIR}/extra-src__radeon_kms.c
PLIST_SUB+=	OLD="@comment "
.endif

.include <bsd.port.mk>
