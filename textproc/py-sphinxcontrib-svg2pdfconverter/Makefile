PORTNAME=	sphinxcontrib-svg2pdfconverter
PORTVERSION=	2.1.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinxcontrib_svg2pdfconverter-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx SVG to PDF converter extension
WWW=		https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=1.6.3,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.11+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFAULT=	CAIROSVG
OPTIONS_GROUP=		RENDERER
OPTIONS_GROUP_RENDERER=	CAIROSVG INKSCAPE RSVG

CAIROSVG_DESC=	Python Cairo SVG
INKSCAPE_DESC=	Inkscape
RENDERER_DESC=	SVG to PDF runtime renderer
RSVG_DESC=	Rust librsvg2 (graphics/librsvg2)

CAIROSVG_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairosvg>0:graphics/py-cairosvg@${PY_FLAVOR}
INKSCAPE_RUN_DEPENDS=	inkscape>0:graphics/inkscape
RSVG_USES=		gnome
RSVG_USE=		GNOME=librsvg2

.include <bsd.port.mk>
