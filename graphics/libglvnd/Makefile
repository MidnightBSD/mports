PORTNAME=	libglvnd
DISTVERSION=	1.4.0
PORTREVISION=	1
CATEGORIES=	graphics
PATCH_SITES=	https://gitlab.freedesktop.org/glvnd/libglvnd/-/commit/
PATCHFILES=	28da9963e52ee2d2e1501351eb26b77cec89f886.diff:-p1 \
		d853cf56f81afff725946eec1144560a121da5af.diff:-p1 \
		b90f235998e199d810ef61c0a8dc103d297962cb.diff:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GL Vendor-Neutral Dispatch library

LICENSE=	apache2 mit
LICENSE_COMB=	multi

WRKSRC=	${WRKDIR}/${PORTNAME}-${GL_COMMIT}

USES=		compiler:c++11-lib localbase meson pkgconfig
USE_LDCONFIG=	yes

USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	glvnd
GL_COMMIT=	8f3c5b17a21e2222ab3e5fd38870b915815aca49

OPTIONS_DEFINE=	X11
OPTIONS_DEFAULT=X11
OPTIONS_SUB=	yes

X11_USES=		xorg
X11_USE=		XORG=x11,xext,xorgproto
X11_MESON_ENABLED=	x11 glx

NO_TEST=	yes
MESON_DISABLED=	tests

USE_GCC=	yes

.include <bsd.mport.options.mk>

# Lots of software expects gl.pc even when it can build with EGL only
post-install-X11-off:
	${LN} -s opengl.pc ${FAKE_DESTDIR}${PREFIX}/libdata/pkgconfig/gl.pc

.include <bsd.port.mk>
