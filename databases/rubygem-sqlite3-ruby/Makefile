PORTNAME=	sqlite3-ruby
PORTVERSION=	1.3.3
PORTREVISION=	1
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to the SQLite DB engine version 3
WWW=		https://github.com/sparklemotion/sqlite3-ruby

LICENSE=	bsd3

BUILD_DEPENDS=	swig:devel/swig
RUN_DEPENDS=	rubygem-sqlite3>=1.3.3:databases/rubygem-sqlite3

USES=		gem sqlite

CONFIGURE_ARGS=	--with-sqlite3-dir=${LOCALBASE}
NO_ARCH=	yes

PLIST_FILES=	bin/sqlite3_ruby

.include <bsd.port.mk>
