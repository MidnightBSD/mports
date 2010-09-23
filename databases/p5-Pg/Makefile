# $MidnightBSD$

PORTNAME=	Pg
PORTVERSION=	2.1.1
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PGSQL}
MASTER_SITE_SUBDIR=	projects/gborg/pgperl/stable
PKGNAMEPREFIX=	p5-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interface for using perl5 to access PostgreSQL databases
LICENSE=	perl

USE_PGSQL=	yes
PERL_CONFIGURE=	yes

MAN3=		Pg.3

CONFIGURE_ENV=	POSTGRES_INCLUDE=${LOCALBASE}/include POSTGRES_LIB=${LOCALBASE}/lib

.include <bsd.port.mk>
