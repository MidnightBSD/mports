PORTNAME=	uharfbuzz
PORTVERSION=	0.46.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Streamlined Cython bindings for the harfbuzz shaping engine
WWW=		https://github.com/harfbuzz/uharfbuzz

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	harfbuzz>=10.2.0:print/harfbuzz \
		${PYTHON_PKGNAMEPREFIX}pkgconfig>=0:devel/py-pkgconfig@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=36.4:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=2.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz

USES=		compiler:c++11-lang pkgconfig python
USE_PYTHON=	autoplist concurrent cython pep517

FAKE_MAKEENV+=	CYTHON_ANNOTATE=0 CYTHON_LINETRACE=0 USE_SYSTEM_LIBS=1

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/setup.py ${WRKSRC}/src/uharfbuzz/_harfbuzz.cpp
# Clean up bundled libraries
	@${RM} -r ${WRKSRC}/harfbuzz/

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
