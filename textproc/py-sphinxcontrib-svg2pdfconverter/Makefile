PORTNAME=	sphinxcontrib-svg2pdfconverter
PORTVERSION=	1.2.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx extension for converting SVG to PDF
WWW=		https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>0:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent distutils flavors

NO_ARCH=	yes

OPTIONS_DEFINE=	RSVGIMPL
RSVGIMPL_DESC=	Depend on the Rust implementation of rsvg-convert

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MRSVGIMPL}
RUN_DEPENDS+=	rsvg-convert:graphics/librsvg2-rust
.else
RUN_DEPENDS+=	rsvg-convert:graphics/librsvg2
.endif

.include <bsd.port.mk>
