# Created by: Florian Limberger <flo@snakeoilproductions.net>

PORTNAME=	mypy
PORTVERSION=	0.812
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optional static typing for Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mypy_extensions>=0.4.3:devel/py-mypy_extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typed-ast>=1.4.0:devel/py-typed-ast@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=3.7.4:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python:3.5+ shebangfix
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

SHEBANG_FILES=	mypy/typeshed/*/*.py

OPTIONS_DEFINE=	DMYPY
OPTIONS_DEFAULT=DMYPY
DMYPY_DESC=	Daemon mode

DMYPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psutil>=4.0:sysutils/py-psutil@${PY_FLAVOR}

.include <bsd.port.mk>
