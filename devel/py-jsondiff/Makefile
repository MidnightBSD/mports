PORTNAME=	jsondiff
PORTVERSION=	2.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diff JSON and JSON-like structures in Python
WWW=		https://github.com/xlwings/jsondiff

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	jojodiff py*-jsonpatch # bin/jdiff

NO_ARCH=	yes

.include <bsd.port.mk>
