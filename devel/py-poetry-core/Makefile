PORTNAME=	poetry-core
PORTVERSION=	1.9.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/python-poetry/poetry-core/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	poetry_core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Poetry PEP 517 Build Backend
WWW=		https://github.com/python-poetry/poetry-core

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent pep517

BINARY_ALIAS=	git=false
NO_ARCH=	yes

.include <bsd.port.mk>
