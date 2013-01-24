# $MidnightBSD: mports/www/linux-firefox/Makefile,v 1.32 2012/09/02 19:39:53 laffer1 Exp $

PORTNAME=	firefox
DISTVERSION=	17.0.2
CATEGORIES=	www
MASTER_SITE_SUBDIR?=	firefox/releases/${DISTVERSION}esr/linux-i686/en-US
DISTNAME=	${PORTNAME}-${DISTVERSION}esr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
