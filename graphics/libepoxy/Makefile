PORTNAME=	libepoxy
DISTVERSION=	1.5.9
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/anholt/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to handle OpenGL function pointer management

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gl localbase meson pkgconfig python:build shebangfix tar:xz
USE_GL=		glesv2 egl
USE_LDCONFIG=	yes
SHEBANG_FILES=	src/gen_dispatch.py

OPTIONS_DEFINE=		TEST X11
OPTIONS_DEFAULT=	X11
OPTIONS_SUB=		yes

TEST_MESON_TRUE=	tests

X11_USES=		xorg
X11_USE=		GL=gl XORG=x11
X11_MESON_YES=		glx
X11_MESON_TRUE=		x11

.include <bsd.port.mk>
