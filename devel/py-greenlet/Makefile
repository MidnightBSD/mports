PORTNAME=	greenlet
PORTVERSION=	3.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Light-weight microthreads for Python
WWW=		https://github.com/python-greenlet/greenlet

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NOT_FOR_ARCHS=		mips mips64
NOT_FOR_ARCHS_REASON=	greenlet needs to be ported to this platform

USES=		python
USE_PYTHON=	autoplist concurrent distutils

CPPFLAGS+=	-Dregister=

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
