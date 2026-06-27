PORTNAME=	phidl
PORTVERSION=	1.0.1
PORTREVISION=	4
CATEGORIES=	cad python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GDS-based CAD tool for photonic and superconducting circuits
WWW=		https://github.com/amccaugh/phidl

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gdspy>0:cad/py-gdspy@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist
USE_GITHUB=	yes
GH_ACCOUNT=	amccaugh

.include <bsd.port.mk>
