# $MidnightBSD$

PORTNAME=	firefox
DISTVERSION=	24.0

CATEGORIES=	www
MASTER_SITE_SUBDIR?=	firefox/releases/${DISTVERSION}esr/linux-i686/en-US
DISTNAME=	${PORTNAME}-${DISTVERSION}esr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla

LICENSE=	mpl

USE_LDCONFIG=	yes
USE_BZIP2=	yes
REPLACE_GRE=	yes

USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

PREFS_FILE=	${WRKSRC}/${APP_SUBDIR}defaults/preferences/browser-prefs.js
APP_SUBDIR=	browser/ # plugins, extensions

pre-extract:
	cd ../linux-seamonkey && make extract

pre-clean:
	cd ../linux-seamonkey && make clean

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
