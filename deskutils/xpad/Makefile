PORTNAME=	xpad
PORTVERSION=	5.8.0
PORTREVISION=	3
CATEGORIES=	deskutils
MASTER_SITES=	https://launchpad.net/${PORTNAME}/trunk/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Virtual note-pad system for your X11 desktop
WWW=		https://launchpad.net/xpad/trunk

LICENSE=	gpl3

RUN_DEPENDS=	gnome-icon-theme>=0:misc/gnome-icon-theme
LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz \
		libdbusmenu-glib.so:devel/libdbusmenu \
		libayatana-ido3-0.4.so:devel/ayatana-ido \
		libayatana-appindicator3.so:devel/libayatana-appindicator \
		libayatana-indicator3.so:devel/libayatana-indicator

USES=		autoreconf compiler:c++11-lang gmake pkgconfig tar:bzip2 gnome xorg

OPTIONS_DEFINE=	NLS DOCS
OPTIONS_SUB=	yes

CONFLICTS_INSTALL=	xpad3
USE_XORG=	x11 sm ice
USE_GNOME=	gtk30 gtksourceview4 cairo gdkpixbuf
CPPFLAGS+=	${CXXFLAGS} -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
PORTDOCS=	*
PLIST_FILES=	\
bin/xpad \
share/man/man1/xpad.1.gz \
share/applications/xpad.desktop \
share/icons/hicolor/scalable/apps/xpad.svg \
share/metainfo/xpad.appdata.xml \
${DATADIR}/help/xpad-user-help.txt

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls
NLS_PLIST_FILES=	\
share/locale/af/LC_MESSAGES/xpad.mo \
share/locale/bg/LC_MESSAGES/xpad.mo \
share/locale/cs/LC_MESSAGES/xpad.mo \
share/locale/da/LC_MESSAGES/xpad.mo \
share/locale/de/LC_MESSAGES/xpad.mo \
share/locale/en_GB/LC_MESSAGES/xpad.mo \
share/locale/es/LC_MESSAGES/xpad.mo \
share/locale/et/LC_MESSAGES/xpad.mo \
share/locale/fi/LC_MESSAGES/xpad.mo \
share/locale/fr/LC_MESSAGES/xpad.mo \
share/locale/ga/LC_MESSAGES/xpad.mo \
share/locale/hr/LC_MESSAGES/xpad.mo \
share/locale/hu/LC_MESSAGES/xpad.mo \
share/locale/it/LC_MESSAGES/xpad.mo \
share/locale/ja/LC_MESSAGES/xpad.mo \
share/locale/ko/LC_MESSAGES/xpad.mo \
share/locale/lv/LC_MESSAGES/xpad.mo \
share/locale/nl/LC_MESSAGES/xpad.mo \
share/locale/pt/LC_MESSAGES/xpad.mo \
share/locale/ro/LC_MESSAGES/xpad.mo \
share/locale/ru/LC_MESSAGES/xpad.mo \
share/locale/rw/LC_MESSAGES/xpad.mo \
share/locale/sv/LC_MESSAGES/xpad.mo \
share/locale/th/LC_MESSAGES/xpad.mo \
share/locale/tr/LC_MESSAGES/xpad.mo \
share/locale/vi/LC_MESSAGES/xpad.mo \
share/locale/zh_CN/LC_MESSAGES/xpad.mo \
share/locale/zh_TW/LC_MESSAGES/xpad.mo

.include <bsd.mport.options.mk>

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in AUTHORS ChangeLog INSTALL NEWS README TODO THANKS
	${INSTALL_DATA} ${WRKSRC}/${doc} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
