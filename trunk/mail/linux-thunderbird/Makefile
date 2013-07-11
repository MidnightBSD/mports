# $MidnightBSD: mports/mail/linux-thunderbird/Makefile,v 1.39 2013/06/05 02:16:33 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	17.0.7
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	thunderbird/releases/${PORTVERSION}esr/linux-i686/en-US
DISTNAME=	${PORTNAME}-${DISTVERSION}esr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

USE_BZIP2=	yes
USE_GCPIO=	yes

LINUX_DIST_VER=	10
USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
