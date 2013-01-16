# $MidnightBSD: mports/www/linux-seamonkey/Makefile,v 1.28 2012/09/02 19:50:29 laffer1 Exp $

PORTNAME=	seamonkey
PORTVERSION=	2.15
CATEGORIES=	www
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${PORTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser
LICENSE=	mpl

USE_BZIP2=	yes

USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/Makefile.common"
.include <bsd.port.mk>
