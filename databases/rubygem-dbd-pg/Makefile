PORTNAME=	dbd-pg
PORTVERSION=	0.3.9
PORTREVISION=	5
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostgreSQL driver for DBI-for-Ruby
WWW=		http://ruby-dbi.sourceforge.net

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-dbi>=0.4.0:databases/rubygem-dbi \
		rubygem-pg>=0:databases/rubygem-pg

NO_ARCH=	yes
USES=		gem

.include <bsd.port.mk>
