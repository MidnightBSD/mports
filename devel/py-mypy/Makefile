PORTNAME=	mypy
PORTVERSION=	2.4.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optional static typing for Python
WWW=		https://www.mypy-lang.org/ \
		https://github.com/python/mypy

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}types-psutil>=0:devel/py-types-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-setuptools>=0:devel/py-types-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.30.0:devel/py-wheel@${PY_FLAVOR}
BUILD_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ast-serialize>=0.12.1<1.0.0:devel/py-ast-serialize@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}librt>=0.16.0:devel/py-librt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mypy_extensions>=1.0.0:devel/py-mypy_extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pathspec>=1.0.0:devel/py-pathspec@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>=0:databases/py-sqlite3@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	DMYPY MYPYC REPORTS
OPTIONS_DEFAULT=DMYPY MYPYC REPORTS
DMYPY_DESC=	Daemon mode
MYPYC_DESC=	Mypyc support
REPORTS_DESC=	Coverage reports

DMYPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psutil>=4.0:sysutils/py-psutil@${PY_FLAVOR}
MYPYC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=50:devel/py-setuptools@${PY_FLAVOR}
REPORTS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
BUILD_RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1.1.0:textproc/py-tomli@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} >= 31500
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.16.0:devel/py-typing-extensions@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.14.0:devel/py-typing-extensions@${PY_FLAVOR}
.else
BUILD_RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.6.0:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
