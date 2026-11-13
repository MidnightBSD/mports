PORTNAME=	cython-test-exception-raiser
PORTVERSION=	26.4.1
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	cython_test_exception_raiser-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Trivial extension that just raises an exception
WWW=		https://github.com/twisted/cython-test-exception-raiser

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.29.0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent cython pep517

# Cython 3.3 requires Py_LIMITED_API >= 3.9
post-patch:
	@${REINPLACE_CMD} -e 's|0x03080000|0x03090000|; s|"cp38"|"cp39"|' \
		${WRKSRC}/setup.py

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
