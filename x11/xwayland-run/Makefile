PORTNAME=	xwayland-run
PORTVERSION=	0.0.2
PORTREVISION=	1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run Xwayland and compositor headless
WWW=		https://gitlab.freedesktop.org/ofourdan/xwayland-run

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	cage>0:x11-wm/cage

USES=		meson pkgconfig python shebangfix tar:xz

USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	ofourdan

BINARY_ALIAS+=	python3=${PYTHON_VERSION}
SHEBANG_FILES=	src/xwfb-run.py \
		src/xwayland-run.py \
		src/wlheadless-run.py

MESON_ARGS=	-Dcompositor=cage

.include <bsd.port.mk>
