# $MidnightBSD: mports/www/linux-firefox6/Makefile,v 1.5 2011/09/16 17:09:08 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	8.0.1
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
