# $MidnightBSD: mports/www/linux-seamonkey/Makefile,v 1.30 2013/01/24 00:54:18 laffer1 Exp $

PORTNAME=	seamonkey
PORTVERSION=	2.17.1
CATEGORIES=	www
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser
LICENSE=	mpl

USE_BZIP2=	yes

USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/Makefile.common"
.include <bsd.port.mk>
