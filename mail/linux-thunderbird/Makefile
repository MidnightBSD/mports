# $MidnightBSD: mports/mail/linux-thunderbird/Makefile,v 1.31 2012/02/29 21:20:00 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	11.0
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	thunderbird/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

USE_BZIP2=	yes
USE_GCPIO=	yes

LINUX_DIST_VER=	10
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
