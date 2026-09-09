PORTNAME=	menulibre
PORTVERSION=	2.4.0
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	x11
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced menu editor
WWW=		https://bluesabre.org/projects/menulibre/

LICENSE=	gpl3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-distutils-extra>=2.38:devel/py-python-distutils-extra@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>=2.0:sysutils/py-psutil@${PY_FLAVOR}
LIB_DEPENDS=	libgnome-menu-3.so:x11/gnome-menus
RUN_DEPENDS=	xdg-open:devel/xdg-utils \
		pkexec:sysutils/polkit \
		${PYTHON_PKGNAMEPREFIX}psutil>=2.0:sysutils/py-psutil@${PY_FLAVOR}

USES=		gettext gnome python
USE_GNOME=	intltool pygobject3
USE_PYTHON=	distutils
INSTALLS_ICONS=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	bluesabre

OPTIONS_DEFINE=	DOCS

NO_ARCH=	yes

.include <bsd.port.pre.mk>

PYDISTUTILS_INSTALLARGS:=	${PYDISTUTILS_INSTALLARGS:N--single-version-externally-managed}

.include <bsd.port.post.mk>
