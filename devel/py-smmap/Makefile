PORTNAME=	smmap
PORTVERSION=	5.0.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sliding-window memory map manager
WWW=		https://smmap.readthedocs.io/en/latest/ \
		https://github.com/gitpython-developers/smmap

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils unittest

NO_ARCH=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}smmap2

PORTSCOUT=	skipv:6.0.0

.include <bsd.port.mk>
