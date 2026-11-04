PORTNAME=	Pg
PORTVERSION=	2.1.1
PORTREVISION=	2
CATEGORIES=	databases perl5
MASTER_SITES=	PGSQL/projects/gborg/pgperl/stable
PKGNAMEPREFIX=	p5-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface for using perl5 to access PostgreSQL databases
WWW=		https://www.postgresql.org/

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5 pgsql
USE_PGSQL=	yes
USE_PERL5=	configure

NO_TEST=	yes

CONFIGURE_ENV=	POSTGRES_INCLUDE=${LOCALBASE}/include POSTGRES_LIB=${LOCALBASE}/lib
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

.include <bsd.port.mk>
