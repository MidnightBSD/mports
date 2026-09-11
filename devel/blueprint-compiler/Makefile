PORTNAME=	blueprint-compiler
DISTVERSION=	0.22.2
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Markup language for GTK user interfaces
WWW=		https://gitlab.gnome.org/jwestman/blueprint-compiler

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	gtk4>0:x11-toolkits/gtk40

USES=		display gnome meson python shebangfix tar:xz
display_ARGS=	test
USE_GNOME=	pygobject3
SHEBANG_FILES=	${PORTNAME}.py docs/collect-sections.py
NO_ARCH=	yes
# TEST_ENV is initialized before USES extensions append to MAKE_ENV.
TEST_ENV+=	DISPLAY=":${XVFBPORT}"

post-patch:
	@${REINPLACE_CMD} -e "s,'python3','${PYTHON_CMD}'," ${WRKSRC}/meson.build

post-stage:
	${PYTHON_CMD} -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	${PYTHON_CMD} -O -m compileall -d ${PYTHON_SITELIBDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
