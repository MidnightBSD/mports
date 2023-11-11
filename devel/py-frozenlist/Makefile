PORTNAME=	frozenlist
PORTVERSION=	1.4.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	List-like structure which implements collections.abc.MutableSequence
WWW=		https://github.com/aio-libs/frozenlist

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gettext-runtime python
USE_PYTHON=	autoplist cython distutils

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
