PORTNAME=	activerecord-jdbc-adapter
PORTVERSION=	51.0
CATEGORIES=	databases rubygems java
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JDBC adapter for ActiveRecord, for use within JRuby on Rails
WWW=		https://github.com/jruby/activerecord-jdbc-adapter

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	jruby:lang/jruby \
		rubygem-activerecord5>=5.1.0:databases/rubygem-activerecord5

NO_ARCH=	yes
USES=		gem

.include <bsd.port.mk>
