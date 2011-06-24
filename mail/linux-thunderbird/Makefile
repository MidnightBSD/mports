# $MidnightBSD: mports/mail/linux-thunderbird/Makefile,v 1.22 2010/03/18 00:43:46 laffer1 Exp $

PORTNAME=	thunderbird
PORTVERSION=	2.0.0.24
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above
LICENSE=	mpl

CONFLICTS=	linux-thunderbird-3* linux-thunderbird3-3*

USE_GCPIO=	yes

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
