# Created by: Ju Pengfei <jupengfei@gmail.com>

PORTNAME=	python-distutils-extra
PORTVERSION=	3.5
CATEGORIES=	devel python
MASTER_SITES=	DEBIAN
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-distutils-extra_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Add support for i18n, documentation, and icons to distutils

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
BUILD_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=63.1.0:devel/py-setuptools@${PY_FLAVOR}
RUN_DEPENDS=	intltool-update:textproc/intltool \
		msgfmt:devel/gettext-tools

USES=		python:3.9+ tar:xz
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
WRKSRC=		${WRKDIR}/python-distutils-extra

.include <bsd.port.mk>
