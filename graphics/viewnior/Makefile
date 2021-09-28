PORTNAME=	viewnior
PORTVERSION=	1.7
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	graphics

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	Fast and simple image viewer

LICENSE=	gpl3

LIB_DEPENDS=	libexiv2.so:graphics/exiv2

USES=		compiler:c++11-lang desktop-file-utils gettext-tools gnome \
		meson ninja pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	hellosiyan
GH_PROJECT=	Viewnior

USE_GNOME=	gdkpixbuf2 glib20 gtk20 intlhack intltool
INSTALLS_ICONS=	yes

PORTDOCS=	AUTHORS NEWS README.md TODO

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime

pre-configure:
	${MKDIR} ${WRKSRC}/m4

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
