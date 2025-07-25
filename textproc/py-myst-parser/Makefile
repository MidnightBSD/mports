PORTNAME=	myst-parser
PORTVERSION=	4.0.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	myst_parser-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extended commonmark compliant parser with bridges to docutils & sphinx
WWW=		https://myst-parser.readthedocs.io/en/latest/ \
		https://github.com/executablebooks/MyST-Parser

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.4<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0.19:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdown-it-py>=3.0<4:textproc/py-markdown-it-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mdit-py-plugins>0:textproc/py-mdit-py-plugins@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=5:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	LINKIFY
LINKIFY_DESC=	Linkify extension

LINKIFY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}linkify-it-py>=2.0<3:textproc/py-linkify-it-py@${PY_FLAVOR}

.include <bsd.port.mk>
