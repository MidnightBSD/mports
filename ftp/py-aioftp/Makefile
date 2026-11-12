PORTNAME=	aioftp
PORTVERSION=	0.27.2
CATEGORIES=	ftp python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FTP client/server for asyncio
WWW=		https://pypi.org/project/aioftp/ \
		https://aioftp.readthedocs.io/ \
		https://github.com/aio-libs/aioftp

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/license.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}siosocks>=0.2.0:net/py-siosocks@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=0:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trustme>=0:security/py-trustme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}async_timeout>=4.0.0:devel/py-async_timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna>=0:dns/py-idna@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest
NO_ARCH=	yes

TEST_ARGS=	-x --durations 10 -p no:anyio --cov=aioftp --import-mode=importlib

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.13.2:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
