# $MidnightBSD$

PORTNAME=	postgresql
PORTVERSION=	1.1.0
PORTREVISION=	1
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP \
		http://python.projects.postgresql.org/files/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 3 compatible PostgreSQL database driver and tools

LICENSE=	bsd3

USES=		zip pgsql python:3.3+
USE_PYTHON=	distutils autoplist
USE_PYDISTUTILS=       yes
PYDISTUTILS_AUTOPLIST= yes


.include <bsd.port.mk>
