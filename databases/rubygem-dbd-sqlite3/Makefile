PORTNAME=	dbd-sqlite3
PORTVERSION=	1.2.5
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SQLite3 driver for DBI-for-Ruby
WWW=		http://ruby-dbi.sourceforge.net

LICENSE=	bsd3

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-dbi>=0.4.0:databases/rubygem-dbi \
		rubygem-sqlite3-ruby>=0:databases/rubygem-sqlite3-ruby

NO_ARCH=	yes

USES=		gem

.include <bsd.port.mk>
