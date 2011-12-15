# $MidnightBSD: mports/games/wesnoth/Makefile,v 1.8 2010/05/08 02:25:37 laffer1 Exp $

PORTNAME=	wesnoth
PORTVERSION=	1.4.7
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-1.4/${PORTNAME}-${PORTVERSION} \
		http://www.wesnoth.org/files/
MASTER_SITE_SUBDIR=	wesnoth

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fantasy turn-based strategy game
LICENSE=	gpl2

LIB_DEPENDS=	boost_thread.4:${PORTSDIR}/devel/boost-python \
		freetype.9:${PORTSDIR}/print/freetype2

USE_SDL=	image mixer net
USE_GNOME=	
USE_GMAKE=	yes
WANT_GNOME=	yes
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var \
		--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE} \
		--with-freetype-prefix=${LOCALBASE} \
		--with-localedir=${PREFIX}/share/locale
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		CXXFLAGS="-I${LOCALBASE}/include ${CXXFLAGS} -ftemplate-depth-45" \
		LDFLAGS="-L${LOCALBASE}/lib -lintl"

MAN6=		wesnoth.6
MANLANG=	"" ca_ES@valencia cs da de es fr gl hu it ja
MANLANG+=	nl pl sk sr sr@latin sv tr zh_CN zh_TW

OPTIONS=	CAMPAIGN "Enable campaign server" On \
		EDITOR	"Enable map editor"  On \
		NLS	"Enable localization" On \
		SERVER "Enable server" On \
		TOOLS "Enable extra tools for artists and translators" On

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITHOUT_CAMPAIGN)
PLIST_SUB+=		CAMPAIGN="@comment "
.else
CONFIGURE_ARGS+=	--enable-campaign-server
PLIST_SUB+=		CAMPAIGN=""
.endif

.if defined(WITHOUT_EDITOR)
PLIST_SUB+=		EDITOR="@comment "
.else
CONFIGURE_ARGS+=	--enable-editor
MAN6+=			wesnoth_editor.6
PLIST_SUB+=		EDITOR=""
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.else
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.endif

.if defined(WITHOUT_SERVER)
PLIST_SUB+=		SERVER="@comment "
.else
CONFIGURE_ARGS+=	--enable-server
MAN6+=			wesnothd.6
PLIST_SUB+=		SERVER=""
.endif

.if defined(WITHOUT_TOOLS)
PLIST_SUB+=		TOOLS="@comment "
.else
CONFIGURE_ARGS+=	--enable-tools
PLIST_SUB+=		TOOLS=""
.endif

post-patch:
	${REINPLACE_CMD} -e 's|libpng12|libpng14|g' ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|png_voidp_NULL|NULL|g' \
 	                 -e 's|png_error_ptr_NULL|NULL|g' \
 	                 ${WRKSRC}/src/tools/exploder_utils.cpp

post-configure:
	@${REINPLACE_CMD} -e 's|[$$][{]datarootdir[}]/icons|${LOCALBASE}/share/pixmaps|' \
			${WRKSRC}/icons/Makefile

.include <bsd.port.post.mk>
