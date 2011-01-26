# $MidnightBSD: mports/www/linux-firefox-devel/Makefile,v 1.10 2008/06/20 02:09:39 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	3.0b2
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US
PKGNAMESUFFIX=		-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_BZIP2=	yes

FORBIDDEN=	security issues.

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
