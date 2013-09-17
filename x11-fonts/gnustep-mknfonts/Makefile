# $MidnightBSD$

PORTNAME=	mknfonts
PORTVERSION=	0.5
PORTREVISION=	2
CATEGORIES=	x11-fonts gnustep
MASTER_SITES=	http://ftp.debian.org/debian/pool/main/m/mknfonts.tool/
PKGNAMEPREFIX=	gnustep-
DISTFILES=	mknfonts.tool_${PORTVERSION}.orig.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create nfont files for use with GNUstep art backend
LICENSE=	unknown

LIB_DEPENDS=    freetype.9:${PORTSDIR}/print/freetype2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

.include <bsd.port.mk>
