PORTNAME=	mkdocs-simple-hooks
DISTVERSIONPREFIX=	v
DISTVERSION=	0.1.5
CATEGORIES=	textproc python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MkDocs plugin to define hooks
WWW=		https://github.com/aklajnert/mkdocs-simple-hooks

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mkdocs>=1.2.0:textproc/py-mkdocs@${PY_FLAVOR}

TEST_DEPENDS=	${RUN_DEPENDS} \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR}

USES=		python
USE_GITHUB=	yes
GH_ACCOUNT=	aklajnert
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

#do-test:
#	cd ${WRKSRC} && ${PYTHON_CMD} -m pytest tests.py

.include <bsd.port.mk>
