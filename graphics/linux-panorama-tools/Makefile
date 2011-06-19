# $MidnightBSD: mports/graphics/linux-panorama-tools/Makefile,v 1.3 2009/04/15 00:11:40 laffer1 Exp $
#
# This port has been made as a running dependence for the hugin port.
# The hugin port for itself would run with no problem without this port,
# but the final step that generates the panorama images make use of the
# external program PTStitcher, installed by this port.
# This port, as a dependence, does not install the complete linux
# panorama tools, just the few things necessary to hugin. If someone
# wants the rest just tell me.

PORTNAME=	linux-panorama-tools
PORTVERSION=	2.6b1
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	http://www.all-in-one.ee/~dersch/
DISTNAME=	PanoTools

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Software to View, Create, Edit and Remap Panoramic Images
LICENSE=	unknown

NO_BUILD=	yes
USE_LINUX=	yes
USE_LINUX_APPS=	jpeg png10 tiff
WRKSRC=	${WRKDIR}/PTLinux
PROGRAM=	Helpers/PTStitcher

SUB_FILES=	pkg-install
SUB_LIST=	PORTNAME=${PORTNAME} LINUXBASE=${LINUXBASE}

do-install:
	${MKDIR} ${PREFIX}/${PORTNAME}/lib
	${MKDIR} ${PREFIX}/${PORTNAME}/bin
	${CP} ${WRKSRC}/${PROGRAM} ${PREFIX}/${PORTNAME}/bin
	${CHMOD} 555 ${PREFIX}/${PORTNAME}/bin/PTStitcher
	${CP} ${WRKSRC}/libpano12.so ${PREFIX}/${PORTNAME}/lib
	${CHMOD} 555 ${PREFIX}/${PORTNAME}/lib/libpano12.so
	${LN} -s ${PREFIX}/${PORTNAME}/bin/PTStitcher ${PREFIX}/bin/PTStitcher

.include <bsd.port.mk>
