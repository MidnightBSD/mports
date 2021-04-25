PORTNAME=	cassandra-driver
DISTVERSION=	3.18.0
PORTREVISION=	0
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python client library for Apache Cassandra

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist cython distutils

OPTIONS_DEFINE=	LIBEV MURMUR3
LIBEV_DESC=	Use devel/libev for event loop
MURMUR3_DESC=	Enable murmur3 extension
OPTIONS_DEFAULT=	LIBEV MURMUR3

LIBEV_LIB_DEPENDS=	libev.so:devel/libev
LIBEV_VARS=	STRIPFILES=${STAGEDIR}${PYTHON_SITELIBDIR}/cassandra/io/libevwrapper*.so
LIBEV_VARS_OFF=	PYDISTUTILS_BUILDARGS+=--no-libev PYDISTUTILS_INSTALLARGS+=--no-libev

MURMUR3_VARS_OFF=	PYDISTUTILS_BUILDARGS+=--no-murmur3 PYDISTUTILS_INSTALLARGS+=--no-murmur3

NO_TEST=	yes

.include <bsd.mport.options.mk>

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' | ${XARGS} ${STRIP_CMD}

.include <bsd.port.mk>
