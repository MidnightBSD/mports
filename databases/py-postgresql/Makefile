

PORTNAME=	postgresql
PORTVERSION=	1.1.0
PORTREVISION=	3
CATEGORIES=	databases python
MASTER_SITES=	PYPI \
		http://python.projects.postgresql.org/files/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 3 compatible PostgreSQL database driver and tools

LICENSE=	bsd3

USES=		zip pgsql python:3.3+
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
