# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>

PORTNAME=	orca
PORTVERSION=	40.0
PORTREVISION=	2
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scriptable screen reader

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
CONFLICTS=	py*-json-py-[0-9]*
PORTSCOUT=	limitw:1,even

NO_ARCH=	yes
USES=		cpe gettext gmake gnome localbase pathfix pkgconfig \
		python:3.4+ tar:xz
USE_GNOME=	gtk30 pygobject3
INSTALLS_ICONS=	yes
GNU_CONFIGURE=	yes
CPE_VENDOR=	gnome

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/src/orca/orca_i18n.py

.include <bsd.port.mk>
