# $MidnightBSD$

PORTNAME=	thunderbird
DISTVERSION=	38.6.0
CATEGORIES=	mail news net-im ipv6
DISTNAME=	${PORTNAME}-${DISTVERSION}
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}/linux-i686/en-US

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird is standalone mail and news that stands above

LICENSE=	mpl gpl2
LICENSE_COMB=	dual

USES+=		tar:bzip2
WANT_GTK218=	yes

USE_LINUX_APPS=	dbusglib dbuslibs alsalib alsa-plugins-oss

.include "${.CURDIR}/../../www/linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
