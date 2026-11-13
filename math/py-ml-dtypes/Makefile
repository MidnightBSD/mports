PORTNAME=	ml-dtypes
PORTVERSION=	0.6.0
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	ml_dtypes-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stand-alone implementation of several NumPy dtype extensions
WWW=		https://github.com/jax-ml/ml_dtypes

LICENSE=	Apache-2.0 MPL20
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE
LICENSE_FILE_MPL20=	${WRKSRC}/LICENSE.eigen

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0,1<3,1:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scikit-build-core>=1.0:devel/py-scikit-build-core@${PY_FLAVOR}

USES=		cmake:indirect python:3.10+
USE_PYTHON=	autoplist concurrent pep517

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} >= 31400
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}numpy>=2.3.0,1:math/py-numpy@${PY_FLAVOR}
.elif ${PYTHON_REL} >= 31300
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}numpy>=2.1.0,1:math/py-numpy@${PY_FLAVOR}
.else
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0.0,1:math/py-numpy@${PY_FLAVOR}
.endif

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.post.mk>
