PORTNAME=	libvdpau
PORTVERSION=	1.5
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VDPAU wrapper and tracing library
WWW=		https://freedesktop.org/wiki/Software/VDPAU

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		localbase meson pkgconfig xorg
USE_GITLAB=	yes
USE_XORG=	x11 xext xorgproto
USE_LDCONFIG=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	vdpau
GL_TAGNAME=	79f1506a3307d3275b0fdfb2e110c173f68e6f78
MESON_ARGS=	-Ddocumentation=false

post-patch:	.SILENT
	cd ${WRKSRC}/src && ${MV} vdpau_wrapper.cfg vdpau_wrapper.cfg.sample
	${REINPLACE_CMD} 's/vdpau_wrapper.cfg/&.sample/' \
		${WRKSRC}/src/meson.build

.include <bsd.port.mk>
