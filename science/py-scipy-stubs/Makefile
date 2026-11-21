PORTNAME=	scipy-stubs
DISTVERSION=	1.18.1.1
CATEGORIES=	science python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Type annotations for SciPy
WWW=		https://scipy.org/ \
		https://github.com/scipy/scipy-stubs

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build012>=0.12.22:devel/py-uv-build012@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0<2.8:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy-typing-compat>=20260602.2.0<20260603:devel/py-numpy-typing-compat@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}optype>=0.15.0<0.20:devel/py-optype@${PY_FLAVOR}

USES=		python:3.12+
USE_PYTHON=	autoplist concurrent pep517

_PRIVATE_UV_BUILD_DIR=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/012
MAKE_ENV+=	PYTHONPATH=${_PRIVATE_UV_BUILD_DIR} \
		PATH=${_PRIVATE_UV_BUILD_DIR}/bin:${PATH}
NO_ARCH=	yes

post-extract:
	@${REINPLACE_CMD} -e 's/^license = "\([^"]*\)"/license = {text = "\1"}/' -e '/^license-files/d' ${WRKSRC}/pyproject.toml

.include <bsd.port.mk>
