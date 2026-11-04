PORTNAME=	dbd-mysql
PORTVERSION=	0.4.4
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MySQL driver for DBI-for-Ruby
WWW=		https://github.com/dinoex/ruby-dbi

LICENSE=	bsd3

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-dbi>=0:databases/rubygem-dbi \
		rubygem-mysql>=0:databases/rubygem-mysql

USES=		gem
IGNORE_WITH_MYSQL=	80 81

.include <bsd.port.mk>
