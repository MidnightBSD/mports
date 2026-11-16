PORTNAME=	sphinx-markdown-builder
DISTVERSION=	0.6.11
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx extension to add markdown generation support
WWW=		https://github.com/liran-funaro/sphinx-markdown-builder

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0.45.1:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0.21.2,1:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=9.0.4,1:textproc/py-sphinx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tabulate>=0.10.0:devel/py-tabulate@${PY_FLAVOR}

USES=		python:3.12+ python-setuptools:83
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
