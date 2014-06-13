# $MidnightBSD$

PORTNAME=	seamonkey
DISTVERSION=	2.26
CATEGORIES=	www mail news editors irc ipv6
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser

LICENSE=	mpl gpl2
LICENSE_COMB=	dual

USES+=		tar:bzip2

USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/Makefile.common"
.include <bsd.port.mk>
