PORTNAME=	jedi
PORTVERSION=	0.20.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autocompletion tool for Python
WWW=		https://github.com/davidhalter/jedi

LICENSE=	mit Apache-2.0
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_Apache-2.0=	${WRKSRC}/jedi/third_party/typeshed/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}parso>=0.8.6<0.9.0:textproc/py-parso@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest<9.0.0,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docopt>=0:devel/py-docopt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}colorama>=0:devel/py-colorama@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django52>=0:www/py-django52@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=0:devel/py-typing-extensions@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes
USES=		python:3.10+
USE_PYTHON=	autoplist distutils

#do-test:
#	@cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.mk>
