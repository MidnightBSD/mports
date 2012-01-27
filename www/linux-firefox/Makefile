# $MidnightBSD: mports/www/linux-firefox/Makefile,v 1.26 2012/01/04 01:30:51 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	9.0.1
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
