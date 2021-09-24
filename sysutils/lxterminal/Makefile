PORTNAME=	lxterminal
PORTVERSION=	0.4.0
CATEGORIES=	sysutils
MASTER_SITES=	SF/lxde/LXTerminal%20%28terminal%20emulator%29/LXTerminal%200.4.x/

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	Lightweight terminal emulator from the LXDE project

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

USES=		gmake gnome localbase pkgconfig tar:xz xorg
USE_GNOME=	gtk20 glib20 cairo vte intltool
USE_XORG=	x11 xext

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-gtk3=no
INSTALLS_ICONS=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls
NLS_USES_OFF=		gettext-tools

.include <bsd.mport.options.mk>

post-patch-NLS-off:
	@${REINPLACE_CMD} -e 's|src po|src|' \
		${WRKSRC}/Makefile.in

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
