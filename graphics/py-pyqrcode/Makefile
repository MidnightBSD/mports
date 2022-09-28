PORTNAME=	pyqrcode
PORTVERSION=	1.2.1
CATEGORIES=	graphics python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Python QR code generator with SVG, EPS, PNG and terminal output
WWW=		https://github.com/mnooner256/pyqrcode

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/License

USES=		python:3.6+
USE_GITHUB=	yes # LICENSE_FILE/tests not packaged in sdist
USE_PYTHON=	autoplist distutils

GH_ACCOUNT=	mnooner256
GH_TAGNAME=	674a77b

OPTIONS_DEFINE=		PNG
OPTIONS_DEFAULT=	PNG

PNG_DESC=	PNG output rendering support

PNG_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}png>=0.0.13:graphics/py-png@${PY_FLAVOR}

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
