# $MidnightBSD$

PORTNAME=	pdflib
PORTVERSION=	2.1.10
CATEGORIES=	print
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension to create PDF on the fly

LICENSE=	php

LIB_DEPENDS=	pdf.6:${PORTSDIR}/print/pdflib

USE_PHP=	gd
USE_PHP_BUILD=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	pdf

CONFIGURE_ARGS=	--with-pdflib=${LOCALBASE}

post-extract:
	@${ECHO_CMD} "#define PHP_PDFLIB_VERSION \"${PORTVERSION}\"" > \
		${WRKSRC}/php_pdflib.h

.include <bsd.port.mk>
