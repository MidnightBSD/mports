PORTNAME=	textual
PORTVERSION=	8.2.8
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Modern Text User Interface framework
WWW=		https://github.com/Textualize/textual

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.2.0:devel/py-poetry-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}linkify-it-py>=1<3:textproc/py-linkify-it-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdown-it-py>=2.1.0:textproc/py-markdown-it-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mdit-py-plugins>=0:textproc/py-mdit-py-plugins@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}platformdirs>=3.6.0<5:devel/py-platformdirs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.19.2<3:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=14.2.0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.4.0<5:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
