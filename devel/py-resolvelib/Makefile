PORTNAME=	resolvelib
DISTVERSION=	0.8.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Resolve abstract dependencies into concrete ones
WWW=		https://github.com/sarugaku/resolvelib

LICENSE=	iscl

USES=		python
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}-${PORTNAME}05 ${PYTHON_PKGNAMEPREFIX}-${PORTNAME}07

NO_ARCH=	yes

.include <bsd.port.mk>
