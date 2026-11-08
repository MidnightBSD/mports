PORTNAME=	relatorio
PORTVERSION=	1.0.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Templating library able to output odt and pdf files
WWW=		https://docs.tryton.org/relatorio/latest/ \
		https://github.com/tryton/relatorio

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-tryton>=0:devel/py-hatch-tryton@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Genshi>=0.5:textproc/py-genshi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lxml>=2.0:devel/py-lxml@${PY_FLAVOR}

USES=		python:3.9+ shebangfix
USE_PYTHON=	autoplist concurrent pep517 unittest

NO_ARCH=	yes

SHEBANG_FILES=	relatorio/render.py

OPTIONS_DEFINE=		CHART FODT
OPTIONS_DEFAULT=	CHART FODT
CHART_DESC=		Chart support
FODT_DESC=		OpenDocument support

CHART_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycha>=0.4.0:graphics/py-pycha@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}
FODT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}puremagic>=0:sysutils/py-puremagic@${PY_FLAVOR}

.include <bsd.port.mk>
