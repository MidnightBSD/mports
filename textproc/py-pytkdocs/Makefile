PORTNAME=	pytkdocs
DISTVERSION=	0.16.2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Load Python objects documentation
WWW=		https://github.com/mkdocstrings/pytkdocs

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}django42>0:www/py-django42@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}marshmallow>0:devel/py-marshmallow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic>0:devel/py-pydantic@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

OPTIONS_DEFINE=		NUMPYSTYLE
OPTIONS_DEFAULT=	NUMPYSTYLE

NUMPYSTYLE_DESC=	Enable support for Numpy docstrings
NUMPYSTYLE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docstring-parser>=0.7:textproc/py-docstring-parser@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30900
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}astunparse>=1.6:devel/py-astunparse@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
