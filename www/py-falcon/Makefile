PORTNAME=	falcon
PORTVERSION=	3.0.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance Python framework for building cloud APIs

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-mimeparse>=1.5.2:devel/py-python-mimeparse@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.4.0:devel/py-six@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	distutils autoplist cython

NO_TEST=	yes

post-install:
	@${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/falcon/ -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
