# $FreeBSD: head/devel/pecl-intl/Makefile 373134 2014-11-23 09:20:03Z sunpoet $
# $MidnightBSD$

PORTNAME=	intl
PORTVERSION=	3.0.0
CATEGORIES=	devel
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL extension to support Internationalization(ICU)

LICENSE=	php

LIB_DEPENDS=	libicui18n.so:${PORTSDIR}/devel/icu

USE_PHP=	yes
USE_PHPEXT=	yes
USES=		tar:tgz

.include <bsd.port.mk>
