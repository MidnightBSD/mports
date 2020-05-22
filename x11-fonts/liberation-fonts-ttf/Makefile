PORTNAME=	liberation-fonts-ttf
PORTVERSION=	2.1.0
PORTEPOCH=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/liberationfonts/liberation-fonts/files/4178407

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Liberation fonts from Red Hat to replace MS TTF fonts

LICENSE=	other

BUILD_DEPENDS=	mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale

USES=		xorg fonts
USE_XORG=	x11

PLIST_SUB=	FONTDIR="${FONTDIR:S|${PREFIX}/||}"

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_LIST=	FONTDIR=${FONTDIR}

FONTNAME=	Liberation
FONTDIR=	${PREFIX}/lib/X11/fonts/${FONTNAME}
INSTDAT=	fonts.dir fonts.scale

MKFONTSCL_CMD=	${LOCALBASE}/bin/mkfontscale
MKFONTDIR_CMD=	${LOCALBASE}/bin/mkfontdir

do-build:
	cd ${WRKSRC} && ${MKFONTSCL_CMD}
	${REINPLACE_CMD} -e 's|-misc-|-redhat-|' ${WRKSRC}/fonts.scale
	cd ${WRKSRC} && ${MKFONTDIR_CMD}

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	cd ${WRKSRC} &&	\
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
