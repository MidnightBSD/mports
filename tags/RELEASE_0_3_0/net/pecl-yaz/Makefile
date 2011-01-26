# $MidnightBSD: mports/net/pecl-yaz/Makefile,v 1.3 2008/08/24 19:27:48 laffer1 Exp $
# $FreeBSD: ports/net/pecl-yaz/Makefile,v 1.6 2007/01/11 14:04:12 ale Exp $

PORTNAME=	yaz
PORTVERSION=	1.0.14
PORTREVISION=	1
CATEGORIES=	net 
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension that implements a Z39.50 client
LICENSE=	php

LIB_DEPENDS=	yaz.4:${PORTSDIR}/net/yaz

USE_PHP=	yes
USE_PHPEXT=	yes

CONFIGURE_ARGS=	--with-yaz=${LOCALBASE}

.include <bsd.port.mk>
