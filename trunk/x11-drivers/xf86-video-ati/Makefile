# $MidnightBSD$

PORTNAME=	xf86-video-ati
PORTVERSION=	7.5.0
PORTREVISION=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org ati display driver

LICENSE=	mit

USE_GL=		gl
XORG_CAT=	driver
USE_XORG=	xf86driproto \
		xineramaproto \
		xf86miscproto \
		glproto \
		presentproto
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS+=--disable-udev
CONFIGURE_ARGS+=--disable-glamor

.include <bsd.mport.options.mk>

.if (${OSVERSION} >= 903000 && ${OSVERSION} < 1000000)
RUN_DEPENDS+=	drm-kmod>=9:${PORTSDIR}/x11-drivers/drm-kmod

post-patch:
	@${REINPLACE_CMD} -e 's|"radeonkms"|"radeonkms_port"|g' \
		${WRKSRC}/src/radeon_kms.c
.endif

.include <bsd.port.mk>
