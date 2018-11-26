# $FreeBSD: head/devel/pecl-intl/Makefile 373134 2014-11-23 09:20:03Z sunpoet $
# $MidnightBSD$

PORTNAME=	intl
PORTVERSION=	3.0.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL extension to support Internationalization(ICU)

LICENSE=	php

LIB_DEPENDS=	libicui18n.so:devel/icu

USE_PHP=	yes
USE_PHPEXT=	yes
IGNORE_WITH_PHP=70 71 72 73
USES=		compiler:c++11-lib tar:tgz
USE_CXXSTD=	gnu++11

CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

.include <bsd.port.mk>
