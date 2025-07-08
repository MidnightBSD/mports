PORTNAME=	postgres_ext
PORTVERSION=	3.0.1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostgreSQL data types extension for ActiveRecord
WWW=		https://github.com/dockyard/postgres_ext

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	rubygem-activerecord4>=4.0:databases/rubygem-activerecord4 \
		rubygem-arel6>=4.0.1:databases/rubygem-arel6 \
		rubygem-pg_array_parser>=0.0.9:databases/rubygem-pg_array_parser

NO_ARCH=	yes
USES=		gem

.include <bsd.port.mk>
