# $MidnightBSD$

PORTNAME=	firefox
DISTVERSION=	40.0
PORTEPOCH=	1
CATEGORIES=	www ipv6
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US
DISTNAME=	${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla

LICENSE=	mpl gpl
LICENSE_COMB=	dual

USES+=		tar:bzip2
WANT_GTK218=	yes

USE_LINUX_APPS=	dbusglib dbuslibs alsalib

PREFS_FILE=	${WRKSRC}/${APP_SUBDIR}defaults/preferences/browser-prefs.js
APP_SUBDIR=	browser/ # plugins, extensions

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
