# $MidnightBSD: mports/converters/pecl-fribidi/Makefile,v 1.6 2010/02/28 21:32:34 laffer1 Exp $

PORTNAME=	fribidi
PORTVERSION=	1.2
CATEGORIES=	converters 
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL extension for the unicode Bidi algorithm
LICENSE=	php

LIB_DEPENDS=	fribidi.3:${PORTSDIR}/converters/fribidi

USE_PHP=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--with-fribidi=${LOCALBASE}

.include <bsd.port.mk>
