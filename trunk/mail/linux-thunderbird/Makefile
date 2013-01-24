# $MidnightBSD: mports/mail/linux-thunderbird/Makefile,v 1.35 2013/01/16 01:37:19 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	13.0
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	thunderbird/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

USE_BZIP2=	yes
USE_GCPIO=	yes

LINUX_DIST_VER=	10
USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
