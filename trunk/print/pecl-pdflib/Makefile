# $MidnightBSD: mports/print/pecl-pdflib/Makefile,v 1.3 2008/05/15 08:25:42 laffer1 Exp $

PORTNAME=	pdflib
PORTVERSION=	2.1.5
CATEGORIES=	print
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension to create PDF on the fly
LICENSE=	php

LIB_DEPENDS=	pdf.8:${PORTSDIR}/print/pdflib

USE_PHP=	gd
USE_PHP_BUILD=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	pdf

CONFIGURE_ARGS=	--with-pdflib=${LOCALBASE}

.include <bsd.port.mk>
