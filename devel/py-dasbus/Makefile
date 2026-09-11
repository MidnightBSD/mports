PORTNAME=	dasbus
DISTVERSION=	1.7
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus library written in Python and based on GLib
WWW=		https://github.com/dasbus-project/dasbus

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=\t${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

USES=		gnome python
USE_GNOME=	glib20 pygobject3
USE_PYTHON=	autoplist concurrent pep517

.include <bsd.port.mk>
