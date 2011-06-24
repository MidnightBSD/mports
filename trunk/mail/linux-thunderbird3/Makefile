# $MidnightBSD: mports/mail/linux-thunderbird/Makefile,v 1.22 2010/03/18 00:43:46 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	3.0.11
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	thunderbird/releases/${PORTVERSION}/linux-i686/en-US
PKGNAMESUFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

CONFLICTS=	linux-thunderbird-2*

USE_BZIP2=	yes
USE_GCPIO=	yes

USE_LINUX_APPS= dbusglib dbuslibs alsalib

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
