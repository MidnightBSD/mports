PORTNAME=	Pg
PORTVERSION=	2.1.1
PORTREVISION=	2
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PGSQL}
MASTER_SITE_SUBDIR=	projects/gborg/pgperl/stable
PKGNAMEPREFIX=	p5-
DIST_SUBDIR=	postgresql

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface for using perl5 to access PostgreSQL databases

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5 pgsql
USE_PGSQL=	yes
USE_PERL5=	configure

CONFIGURE_ENV=	POSTGRES_INCLUDE=${LOCALBASE}/include POSTGRES_LIB=${LOCALBASE}/lib
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

.include <bsd.port.mk>
