# $MidnightBSD: mports/mail/linux-thunderbird5/Makefile,v 1.2 2011/08/31 02:03:57 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	6.0.2
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	thunderbird/releases/${PORTVERSION}/linux-i686/en-US
PKGNAMESUFFIX=	5

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

CONFLICTS=	linux-thunderbird-2* linux-thunderbird-3*

USE_BZIP2=	yes
USE_GCPIO=	yes

LINUX_DIST_VER= 10
USE_LINUX_APPS= dbusglib dbuslibs alsalib

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
