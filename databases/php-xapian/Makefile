PORTNAME=	xapian
PORTVERSION=	1.4.29
DISTVERSIONPREFIX=	bindings-
CATEGORIES=	databases
MASTER_SITES=	https://oligarchy.co.uk/xapian/${PORTVERSION}/ \
		FREEBSD_LOCAL/sunpoet
PKGNAMEPREFIX=	${PHP_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PHP binding for Xapian
WWW=		https://xapian.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xapian-core>=${PORTVERSION}:databases/xapian-core
LIB_DEPENDS=	libxapian.so:databases/xapian-core

USES=		compiler:c++11-lang libtool php:build,flavors tar:xz

CONFIGURE_ARGS=	--datarootdir=${DATADIR} \
		--docdir=${DOCSDIR} \
		--enable-shared \
		--enable-static \
		--with-php \
		--without-csharp \
		--without-java \
		--without-lua \
		--without-perl \
		--without-python \
		--without-python3 \
		--without-ruby \
		--without-tcl
CONFIGURE_ENV=	PHP_CONFIG=${LOCALBASE}/bin/php-config
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++11

PLIST_SUB=	PHP_EXT_DIR=${PHP_EXT_DIR}

CONFLICTS_INSTALL=	xapian-bindings12

PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
