# New ports collection makefile for:	linux-firefox-devel
# Date created:		8 May 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/linux-firefox-devel/Makefile,v 1.9 2008/03/05 22:45:00 laffer1 Exp $
# $FreeBSD: ports/www/linux-firefox-devel/Makefile,v 1.23 2007/12/21 16:27:10 sat Exp $
#

PORTNAME=	firefox
DISTVERSION=	3.0b2
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US
PKGNAMESUFFIX=		-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
