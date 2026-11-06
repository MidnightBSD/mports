# Created by: martin.dieringer@gmx.de

PORTNAME=	python-ly
PORTVERSION=	0.9.10
CATEGORIES=	print python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python package to manipulate LilyPond files

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSES/GPL-3.0-or-later.txt

USES=		python

USE_PYTHON=	autoplist concurrent pep517

DISTVERSION=	0.9.10

MASTER_SITES=	https://github.com/frescobaldi/${PORTNAME}/releases/download/v${DISTVERSION}/

DISTNAME=	${PORTNAME:S|-|_|}-${DISTVERSION}

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.27:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
