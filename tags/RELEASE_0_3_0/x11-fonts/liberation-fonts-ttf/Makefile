# New ports collection makefile for:	Liberation fonts
# Date created:		17 May 2007
# Whom:			Thierry Thomas <thierry@pompo.net>
#
# $MidnightBSD: mports/x11-fonts/liberation-fonts-ttf/Makefile,v 1.2 2008/06/26 18:05:11 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/liberation-fonts-ttf/Makefile,v 1.4 2008/06/11 20:41:13 thierry Exp $
#

PORTNAME=	liberation-fonts-ttf
PORTVERSION=	1.05.2.20091227
PORTEPOCH=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://fedorahosted.org/releases/l/i/liberation-fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Liberation fonts from Red Hat to replace MS TTF fonts
LICENSE=	liberation

BUILD_DEPENDS=	mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale	\
		mkfontdir:${PORTSDIR}/x11-fonts/mkfontdir

USE_XORG=	x11

NO_WRKSUBDIR=	yes
PLIST_SUB=	FONTDIR="${FONTDIR:S|${PREFIX}/||}"

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_LIST=	FONTDIR=${FONTDIR}

FONTNAME=	Liberation
FONTDIR=	${PREFIX}/lib/X11/fonts/${FONTNAME}
INSTDAT=	AUTHORS License.txt ttf/fonts.dir ttf/fonts.scale

MKFONTSCL_CMD=	${LOCALBASE}/bin/mkfontscale
MKFONTDIR_CMD=	${LOCALBASE}/bin/mkfontdir

do-build:
	cd ${WRKSRC}/ttf && ${MKFONTSCL_CMD}
	${REINPLACE_CMD} -e 's|-misc-|-redhat-|' ${WRKSRC}/ttf/fonts.scale
	cd ${WRKSRC}/ttf && ${MKFONTDIR_CMD}

do-install:
	${MKDIR} ${FONTDIR}
	cd ${WRKSRC} &&	\
	${INSTALL_DATA} ${INSTDAT} ttf/*.ttf ${FONTDIR}

.include <bsd.port.mk>
