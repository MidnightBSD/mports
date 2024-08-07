PORTNAME=	opentype-sanitizer
PORTVERSION=	9.1.0
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper for the OpenType Sanitizer
WWW=		https://github.com/googlefonts/ots-python

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	ots-sanitize:x11-fonts/ots

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

LDFLAGS+=	-lpython${PYTHON_VER}${PYTHON_ABIVER}

post-patch:
	@${MV} ${WRKSRC}/build.py ${WRKSRC}/build_ext.py
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/src/python/ots/__init__.py
	@${RM} -r ${WRKSRC}/src/c/

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
