PORTNAME=	amalgamate
PORTVERSION=	0.1.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collapse Python packages into a single module
WWW=		https://github.com/xonsh/amalgamate

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.4+
USE_PYTHON=	autoplist distutils concurrent

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|%%DOCSDIR%%|${DOCSDIR}|' ${WRKSRC}/setup.py

.include <bsd.port.mk>
