PORTNAME=	cairosvg
PORTVERSION=	2.6.0
PORTREVISION=	1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	CairoSVG-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple SVG Converter based on Cairo
WWW=		https://www.courtbouillon.org/cairosvg

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairocffi>=0:graphics/py-cairocffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cssselect2>=0:textproc/py-cssselect2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}defusedxml>=0:devel/py-defusedxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tinycss2>=0:textproc/py-tinycss2@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}isort>=0:devel/py-isort@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flake8>=0:devel/py-flake8@${PY_FLAVOR} \

USES=		cpe python
USE_PYTHON=	autoplist concurrent distutils pytest

NO_ARCH=	yes

CPE_VENDOR=	courtbouillon

post-patch:
	@${LN} -s .. ${WRKSRC}/test_non_regression/cairosvg_reference

.include <bsd.port.mk>
