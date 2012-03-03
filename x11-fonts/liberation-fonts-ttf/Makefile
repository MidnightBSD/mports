# $MidnightBSD: mports/x11-fonts/liberation-fonts-ttf/Makefile,v 1.4 2011/05/10 13:42:42 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/liberation-fonts-ttf/Makefile,v 1.4 2008/06/11 20:41:13 thierry Exp $

PORTNAME=	liberation-fonts-ttf
PORTVERSION=	1.07.0
PORTEPOCH=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://fedorahosted.org/releases/l/i/liberation-fonts/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Liberation fonts from Red Hat to replace MS TTF fonts
LICENSE=	gpl2

BUILD_DEPENDS=	mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale	\
		mkfontdir:${PORTSDIR}/x11-fonts/mkfontdir

USE_XORG=	x11

PLIST_SUB=	FONTDIR="${FONTDIR:S|${PREFIX}/||}"

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_LIST=	FONTDIR=${FONTDIR}

FONTNAME=	Liberation
FONTDIR=	${PREFIX}/lib/X11/fonts/${FONTNAME}
INSTDAT=	AUTHORS fonts.dir fonts.scale

MKFONTSCL_CMD=	${LOCALBASE}/bin/mkfontscale
MKFONTDIR_CMD=	${LOCALBASE}/bin/mkfontdir

do-build:
	cd ${WRKSRC} && ${MKFONTSCL_CMD}
	${REINPLACE_CMD} -e 's|-misc-|-redhat-|' ${WRKSRC}/fonts.scale
	cd ${WRKSRC} && ${MKFONTDIR_CMD}

do-install:
	${MKDIR} ${FONTDIR}
	cd ${WRKSRC} &&	\
	${INSTALL_DATA} ${INSTDAT} *.ttf ${FONTDIR}

.include <bsd.port.mk>
