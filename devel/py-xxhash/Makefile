PORTNAME=	xxhash
PORTVERSION=	3.4.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the xxHash library
WWW=		https://github.com/ifduyue/python-xxhash

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		xxhash>=0.8.1:devel/xxhash
LIB_DEPENDS=	libxxhash.so:devel/xxhash

USES=		localbase python
USE_PYTHON=	autoplist concurrent pep517

CONFIGURE_ENV=	XXHASH_LINK_SO=yes
MAKE_ENV=	XXHASH_LINK_SO=yes

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
