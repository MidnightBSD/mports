PORTNAME=	fontpens
PORTVERSION=	0.2.4
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	fontPens-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of classes implementing the pen protocol for manipulating glyphs
WWW=		https://github.com/robotools/fontPens

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fonttools>=3.32.0:print/py-fonttools@${PY_FLAVOR}

USES=		python zip
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
