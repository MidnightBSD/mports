PORTNAME=	mkdocs-minify-plugin
PORTVERSION=	0.8.0
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minify HTML, JS or CSS files prior to being written to disk
WWW=		https://github.com/byrnereese/mkdocs-minify-plugin

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}csscompressor>=0.9.5:www/py-csscompressor@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}htmlmin2>=0.1.13:textproc/py-htmlmin2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsmin>=3.0.1:devel/py-jsmin@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mkdocs>=1.4.1:textproc/py-mkdocs@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
