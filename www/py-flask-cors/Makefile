PORTNAME=	Flask-Cors
PORTVERSION=	6.0.5
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	flask_cors-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flask extension simplifying CORS support
WWW=		https://flask-cors.corydolphin.com/ \
		https://github.com/corydolphin/flask-cors

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flask>=0.9:www/py-flask@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}werkzeug>=0.7:www/py-werkzeug@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

PEP517_WHEEL_DISTNAME=	flask_cors

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>=4:devel/py-pytest-cov@${PY_FLAVOR}
TEST_ARGS=	--doctest-modules tests --cov --cov-config=pyproject.toml --cov-report=xml

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.6.0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
