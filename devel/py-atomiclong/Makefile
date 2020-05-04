PORTNAME=	atomiclong
PORTVERSION=	0.1.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AtomicLong type using CFFI

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>0:devel/py-cffi@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

#magus
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} '/setup_requires/d' ${WRKSRC}/${PYSETUP}

post-install:
	-${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/_cffi__*.so

.include <bsd.port.mk>
