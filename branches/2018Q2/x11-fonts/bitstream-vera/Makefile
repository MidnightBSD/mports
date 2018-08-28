# $FreeBSD: ports/x11-fonts/bitstream-vera/Makefile,v 1.16 2007/05/19 20:29:08 flz Exp $
# $MidnightBSD$

PORTNAME=	bitstream-vera
PORTVERSION=	1.10
PORTREVISION=	5
CATEGORIES=	x11-fonts
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/ttf-${PORTNAME}/1.10
DISTNAME=	ttf-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitstream Vera TrueType font collection
LICENSE=	unknown

BUILD_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig

USES=	tar:bzip2
NO_BUILD=	yes

PLIST_SUB=	FONTSDIR="${FONTSDIR:S|${PREFIX}/||}"

MSG_FILE=	${PKGDIR}/pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

#
# Local variables
#

FONTNAME=	${PORTNAME}
FONTSDIR?=	${PREFIX}/lib/X11/fonts/${FONTNAME}

OPTIONS_DEFINE=	DOCS

post-patch:
	${SED} 's|%%FONTSDIR%%|${FONTSDIR}|g' ${MSG_FILE} > ${PKGMESSAGE}

do-install: install-fonts install-docs

install-fonts:
	${MKDIR} ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${FONTSDIR}
	${INSTALL_DATA} ${FILESDIR}/fonts.dir ${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYRIGHT.TXT ${FONTSDIR}

install-docs:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.TXT ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/RELEASENOTES.TXT ${DOCSDIR}

.include <bsd.port.mk>
