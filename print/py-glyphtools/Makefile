PORTNAME=	glyphtools
PORTVERSION=	0.8.0
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines for extracting information from fontTools glyphs
WWW=		https://github.com/simoncozens/glyphtools

LICENSE=	Apache-2.0

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}beziers>=0:graphics/py-beziers@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}glyphsLib>=0:x11-fonts/py-glyphsLib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=0,1:math/py-numpy@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
