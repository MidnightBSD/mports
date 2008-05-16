# New ports collection makefile for:	pecl-yaz
# Date created:			9 Jul 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD: mports/net/pecl-yaz/Makefile,v 1.1 2007/02/25 21:59:42 laffer1 Exp $
# $FreeBSD: ports/net/pecl-yaz/Makefile,v 1.6 2007/01/11 14:04:12 ale Exp $
#

PORTNAME=	yaz
PORTVERSION=	1.0.8
CATEGORIES=	net 
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension that implements a Z39.50 client

LIB_DEPENDS=	yaz.2:${PORTSDIR}/net/yaz

USE_PHP=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--with-yaz=${LOCALBASE}

.include <bsd.port.mk>
