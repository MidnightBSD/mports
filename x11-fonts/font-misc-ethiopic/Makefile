PORTNAME=	font-misc-ethiopic
PORTVERSION=	1.0.4
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org miscellaneous Ethiopic font

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

NO_ARCH=	yes

USES=		xorg-cat:font
FONTNAME=	TTF
PLIST_FILES=	"@fcfontsdir ${PREFIX}/share/fonts/OTF" \
		"@comment ${PREFIX}/share/fonts/OTF/fonts.dir" \
		"@comment ${PREFIX}/share/fonts/OTF/fonts.scale"

.include <bsd.port.mk>
