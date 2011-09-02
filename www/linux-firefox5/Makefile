# $MidnightBSD: mports/www/linux-firefox5/Makefile,v 1.2 2011/08/31 02:22:12 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	6.0.1
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US
PKGNAMESUFFIX=		-5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
