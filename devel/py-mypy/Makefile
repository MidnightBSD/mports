PORTNAME=	mypy
PORTVERSION=	1.9.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optional static typing for Python
WWW=		https://www.mypy-lang.org/ \
		https://github.com/python/mypy

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mypy_extensions>=1.0.0:devel/py-mypy_extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=40.6.2:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-psutil>=0:devel/py-types-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-setuptools>=0:devel/py-types-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.1.0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.30.0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mypy_extensions>=1.0.0:devel/py-mypy_extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.1.0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	DMYPY MYPYC REPORTS
OPTIONS_DEFAULT=DMYPY MYPYC REPORTS
DMYPY_DESC=	Daemon mode
MYPYC_DESC=	Mypypc support
REPORTS_DESC=	Coverage reports

DMYPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psutil>=4.0:sysutils/py-psutil@${PY_FLAVOR}
MYPYC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=50:devel/py-setuptools@${PY_FLAVOR}
REPORTS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1.1.0:textproc/py-tomli@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tomli>=1.1.0:textproc/py-tomli@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
