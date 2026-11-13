PORTNAME=	pyopenssl
PORTVERSION=	26.4.0
PORTEPOCH=	1
CATEGORIES=	security python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to the OpenSSL library
WWW=		https://pyopenssl.org/en/latest/ \
		https://github.com/pyca/pyopenssl

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pretend>=0:devel/py-pretend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-rerunfailures>=0:devel/py-pytest-rerunfailures@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cryptography>=49.0.0,1<51,1:security/py-cryptography@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

CPE_VENDOR=	jean-paul_calderone

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31300
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.9:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
