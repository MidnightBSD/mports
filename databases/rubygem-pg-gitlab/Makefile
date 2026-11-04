PORTNAME=	pg
PORTVERSION=	1.6.3
CATEGORIES=	databases rubygems
MASTER_SITES=	RG
PKGNAMESUFFIX=	-gitlab

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to PostgreSQL library
WWW=		https://github.com/ged/ruby-pg

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_bsd2=${WRKSRC}/BSDL
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE

USES=		gem pgsql

CONFIGURE_ARGS=	--with-pgsql-include-dir=`${PG_CONFIG} --includedir` \
		--with-pgsql-lib-dir=`${PG_CONFIG} --libdir`
PG_CONFIG=	${LOCALBASE}/bin/pg_config

PORTSCOUT=	limit:^1\.6\.

.include <bsd.port.mk>
