# $MidnightBSD$

PORTNAME=	gtk
PKGNAMESUFFIX=	12
PORTVERSION=	1.2.10
PORTREVISION=	13
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/1.2
DISTNAME=	gtk+-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (previous stable version)

LICENSE=	lgpl

USES+=		libtool pathfix
USE_PERL5_BUILD=	yes
USE_XORG=	x11 ice xext sm inputproto xi xpm
USE_GNOME=	glib12
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-native-locale \
		--with-xinput=xfree
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

INFO=		gdk gtk

.include <bsd.mport.options.mk>

CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "

post-patch:
	@${MV} ${WRKSRC}/gtk/gtkrc.zh_TW.big5 ${WRKSRC}/gtk/gtkrc.zh_TW.Big5

pre-build:
	${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/gtk/themes/engines
	@${LN} -sf gtk-config ${STAGEDIR}${PREFIX}/bin/gtk12-config

.include <bsd.port.mk>
