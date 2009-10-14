# $MidnightBSD: mports/converters/pecl-fribidi/Makefile,v 1.4 2009/09/20 03:50:51 laffer1 Exp $

PORTNAME=	fribidi
PORTVERSION=	1.0
CATEGORIES=	converters 
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension for the unicode Bidi algorithm
LICENSE=	php

LIB_DEPENDS=	fribidi.3:${PORTSDIR}/converters/fribidi

USE_PHP=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--with-fribidi=${LOCALBASE}
BROKEN=       needs update to work with fribidi-0.19.2

.include <bsd.port.mk>
