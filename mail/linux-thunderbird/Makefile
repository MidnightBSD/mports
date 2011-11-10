# $MidnightBSD: mports/mail/linux-thunderbird5/Makefile,v 1.3 2011/09/10 21:05:32 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	6.0.2
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	thunderbird/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

USE_BZIP2=	yes
USE_GCPIO=	yes

LINUX_DIST_VER= 10
USE_LINUX_APPS= dbusglib dbuslibs alsalib

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
