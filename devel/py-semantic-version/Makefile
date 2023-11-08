PORTNAME=	semantic-version
PORTVERSION=	2.10.0
MASTER_SITES=	PYPI
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	semantic_version-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library provides a few tools to handle SemVer in Python
WWW=		https://github.com/rbarrois/python-semanticversion

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils nose2

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
