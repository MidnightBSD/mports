PORTNAME=	breeze-gtk
DISTVERSION=	${KDE_PLASMA_VERSION}
PORTREVISION=	1
CATEGORIES=	x11-themes kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Breeze widget theme for GTK 2 and 3

LICENSE=	lgpl

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairo>0:graphics/py-cairo@${PY_FLAVOR} \
		plasma6-breeze>0:x11-themes/plasma6-breeze@qt6 \
		sassc:textproc/sassc
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairo>0:graphics/py-cairo@${PY_FLAVOR} \
		plasma6-breeze>0:x11-themes/plasma6-breeze@qt6

USES=		cmake gnome kde:6 python qt:6 tar:xz
USE_GNOME=	gtk20
USE_KDE=	ecm:build
USE_QT=		base

CMAKE_ARGS=	-DPython3_EXECUTABLE:PATH=${PYTHON_CMD}

BINARY_ALIAS=	python3=${PYTHON_CMD}
NO_ARCH=	yes

.include <bsd.port.mk>
