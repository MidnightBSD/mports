# $MidnightBSD: mports/www/linux-firefox-devel/Makefile,v 1.11 2009/06/27 21:47:01 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	3.5.19
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US
PKGNAMESUFFIX=		-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
