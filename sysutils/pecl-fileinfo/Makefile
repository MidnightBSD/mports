# New ports collection makefile for:	pecl-fileinfo
# Date created:			21 Jul 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/pecl-fileinfo/Makefile,v 1.2 2007/05/25 18:00:18 ctriv Exp $
# $FreeBSD: ports/sysutils/pecl-fileinfo/Makefile,v 1.8 2006/11/08 13:33:01 ale Exp $
#

PORTNAME=	fileinfo
PORTVERSION=	1.0.4
CATEGORIES=	sysutils 
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
DISTNAME=	Fileinfo-${PORTVERSION}
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension to retrieve info about files
LICENSE=	php

USE_PHP=	yes
USE_PHPEXT=	yes

.include <bsd.port.pre.mk>

MAGICBASE=	/usr
CONFIGURE_ARGS=	--with-fileinfo=${MAGICBASE}

.include <bsd.port.post.mk>
