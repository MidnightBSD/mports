PORTNAME=	optype
PORTVERSION=	0.19.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Building Blocks for Precise & Flexible Type Hints
WWW=		https://github.com/jorenham/optype/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}uv-build012>=0.12.22:devel/py-uv-build012@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.10:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python:3.12+
USE_PYTHON=	autoplist concurrent pep517

_PRIVATE_UV_BUILD_DIR=	${PYTHONPREFIX_LIBDIR}/mports-uv-build/012
MAKE_ENV+=	PYTHONPATH=${_PRIVATE_UV_BUILD_DIR} \
		PATH=${_PRIVATE_UV_BUILD_DIR}/bin:${PATH}

NO_ARCH=	yes

post-extract:
	@${REINPLACE_CMD} -e 's/^license = "\([^"]*\)"/license = {text = "\1"}/' -e '/^license-files/d' ${WRKSRC}/pyproject.toml

.include <bsd.port.mk>
