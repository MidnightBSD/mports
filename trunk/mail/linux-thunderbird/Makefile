# $MidnightBSD: mports/mail/linux-thunderbird/Makefile,v 1.23 2011/06/24 00:50:38 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	2.0.0.24
PORTREVISION=	2
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

CONFLICTS=	linux-thunderbird-3* linux-thunderbird3-3* linux-thunderbird5-*

USE_GCPIO=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
