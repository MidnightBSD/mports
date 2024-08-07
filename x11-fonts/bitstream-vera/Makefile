PORTNAME=	bitstream-vera
PORTVERSION=	1.10
PORTREVISION=	6
CATEGORIES=	x11-fonts
MASTER_SITES=	GNOME/sources/ttf-${PORTNAME}/${PORTVERSION}
DISTNAME=	ttf-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitstream Vera TrueType font collection
WWW=		https://www.gnome.org/fonts/

LICENSE=	BITSTREAM_VERA
LICENSE_NAME=	Bitstream Vera Fonts Copyright
LICENSE_FILE=	${WRKSRC}/COPYRIGHT.TXT
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	fc-cache:x11-fonts/fontconfig
RUN_DEPENDS=	fc-cache:x11-fonts/fontconfig

USES=		fonts tar:bzip2
NO_BUILD=	yes

PLIST_SUB=	FONTSDIR="${FONTSDIR:S|${PREFIX}/||}"

MSG_FILE=	${PKGDIR}/pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

#
# Local variables
#

FONTNAME=	${PORTNAME}

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
