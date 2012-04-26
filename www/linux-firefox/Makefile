# $MidnightBSD: mports/www/linux-firefox/Makefile,v 1.30 2012/03/19 20:57:59 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	12.0
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
