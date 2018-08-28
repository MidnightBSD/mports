# $MidnightBSD$

PORTNAME=	pyzor
PORTVERSION=	1.0.0
CATEGORIES=	mail python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collaborative, networked system to detect and block spam

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gdbm>=0:databases/py-gdbm

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
