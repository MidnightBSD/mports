PORTNAME=	redland
PORTVERSION=	1.0.17
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://download.librdf.org/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level interface for RDF
WWW=		https://librdf.org

LICENSE=	apache2 gpl2 gpl3 lgpl2.1
LICENSE_COMB=	dual

LIB_DEPENDS=	libltdl.so:devel/libltdl \
		libraptor2.so:textproc/raptor2 \
		librasqal.so:textproc/rasqal

USES=		gmake libtool pathfix perl5 pkgconfig shebangfix
USE_LDCONFIG=	yes
USE_PERL5=	build
SHEBANG_FILES=	scripts/touch-mtime.pl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-threestore=no \
		--with-virtuoso=no

INSTALL_TARGET=	install-strip
TEST_TARGET=	check

OPTIONS_DEFINE=		THREADS
OPTIONS_DEFAULT=	SQLITE

OPTIONS_GROUP=		STORAGE
OPTIONS_GROUP_STORAGE=	BDB MYSQL PGSQL SQLITE

OPTIONS_SUB=	YES

BDB_USES=		bdb:5
BDB_CONFIGURE_WITH=	bdb

MYSQL_LIB_DEPENDS=	libunwind.so:devel/libunwind
MYSQL_USES=		mysql ssl
MYSQL_CONFIGURE_WITH=	mysql
MYSQL_VARS=	IGNORE_WITH_MYSQL="105m 106m 1011m"

PGSQL_USES=		pgsql
PGSQL_CONFIGURE_WITH=	postgresql

SQLITE_USES=		sqlite:3
SQLITE_CONFIGURE_WITH=	sqlite

THREADS_CONFIGURE_WITH=	threads

.include <bsd.port.mk>
