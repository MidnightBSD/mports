PORTNAME=	expat
DISTVERSION=	2.7.1
CATEGORIES=	textproc
MASTER_SITES=	https://github.com/libexpat/libexpat/releases/download/R_${DISTVERSION:S|.|_|g}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML 1.0 parser written in C
WWW=		https://github.com/libexpat/libexpat

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	bash:shells/bash

USES=		cpe libtool pathfix python:test tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPE_VENDOR=	libexpat_project
CPE_PRODUCT=	libexpat

CONFIGURE_ARGS=	--without-docbook --without-examples
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS STATIC TEST
OPTIONS_SUB=	yes

STATIC_CONFIGURE_ENABLE=	static

TEST_USES=	shebangfix
SHEBANG_FILES=	test-driver-wrapper.sh tests/udiffer.py tests/xmltest.sh
TEST_CONFIGURE_WITH=	tests
TEST_TARGET=	check

PLIST_SUB=	EXPAT_VERSION=${DISTVERSION}

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/xmlwf.1 ${PREFIX}/share/man/man1/

.include <bsd.port.mk>
