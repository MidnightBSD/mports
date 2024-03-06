PORTNAME=	rst2ansi
PORTVERSION=	0.1.5
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RST converter to ansi-decorated console output
WWW=		https://github.com/Snaipe/python-rst2ansi

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docutils>=0.14:textproc/py-docutils@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils concurrent autoplist

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC}/ && ${PYTHON_CMD} setup.py test

.include <bsd.port.mk>
