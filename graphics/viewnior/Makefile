PORTNAME=	viewnior
PORTVERSION=	1.8
DISTVERSIONPREFIX=	${PORTNAME}-
PORTREVISION=	2
CATEGORIES=	graphics

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	Fast and simple image viewer
WWW=		https://siyanpanayotov.com/project/viewnior/

LICENSE=	gpl3

LIB_DEPENDS=	libexiv2.so:graphics/exiv2

USES=		compiler:c++11-lang desktop-file-utils gettext-tools gnome \
		meson ninja pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	hellosiyan
GH_PROJECT=	Viewnior

USE_GNOME=	gdkpixbuf glib20 gtk20 intlhack intltool
INSTALLS_ICONS=	yes

PORTDOCS=	AUTHORS NEWS README.md

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime

pre-configure:
	${MKDIR} ${WRKSRC}/m4

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
