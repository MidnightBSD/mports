# New ports collection makefile for:	pecl-fribidi
# Date created:			9 Jul 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/converters/pecl-fribidi/Makefile,v 1.1 2004/07/19 07:26:57 ale Exp $
#

PORTNAME=	fribidi
PORTVERSION=	1.0
CATEGORIES=	converters pear
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension for the unicode Bidi algorithm

LIB_DEPENDS=	fribidi.0:${PORTSDIR}/converters/fribidi

USE_PHP=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--with-fribidi=${LOCALBASE}

.include <bsd.port.mk>
