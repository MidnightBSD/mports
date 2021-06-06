PORTNAME=	smartypants
DISTVERSIONPREFIX=	v
DISTVERSION=	2.0.1
CATEGORIES=	textproc
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Translate plain ASCII punctuation into smart typographic HTML

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python:3.7+
USE_GITHUB=	yes
GH_ACCOUNT=	leohemsted
GH_PROJECT=	${PORTNAME}.py
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
