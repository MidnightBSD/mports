PORTNAME=	lazy-object-proxy
PORTVERSION=	1.12.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	lazy_object_proxy-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and thorough lazy object proxy
WWW=		https://github.com/ionelmc/python-lazy-object-proxy

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
