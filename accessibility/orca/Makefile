PORTNAME=	orca
PORTVERSION=	43.1
PORTREVISION=	5
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scriptable screen reader
WWW=		https://live.gnome.org/Orca

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cairo>=0:graphics/py-cairo@${PY_FLAVOR} \
		itstool:textproc/itstool
LIB_DEPENDS=	libatspi.so:accessibility/at-spi2-core
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}speech-dispatcher>=0:accessibility/py-speech-dispatcher@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}atspi>=0:accessibility/py-atspi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cairo>=0:graphics/py-cairo@${PY_FLAVOR}

# conflict with py*-json-py because orca uses the json from python itself
# and py*-json-py shadows this.
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}orca # lib/python3.8/site-packages/orca/__init__.py
PORTSCOUT=	limitw:1,even

NO_ARCH=	yes
USES=		cpe gettext gmake gnome localbase pathfix pkgconfig \
		python tar:xz
USE_GNOME=	gtk30 pygobject3
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CPE_VENDOR=	gnome

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/src/orca/orca_i18n.py

.include <bsd.port.mk>
