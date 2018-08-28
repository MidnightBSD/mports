# $MidnightBSD$

PORTNAME=	sqlite3dbm
PORTVERSION=	0.1.4
PORTREVISION=	1
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sqlite-backed dictionary

LICENSE=	apache2

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3

USES=		python
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
