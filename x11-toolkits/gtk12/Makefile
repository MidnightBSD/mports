# $MidnightBSD: mports/x11-toolkits/gtk12/Makefile,v 1.12 2011/02/02 21:38:57 laffer1 Exp $

PORTNAME=	gtk
PKGNAMESUFFIX=	12
PORTVERSION=	1.2.10
PORTREVISION=	11
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/1.2
DISTNAME=	gtk+-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gimp Toolkit for X11 GUI (previous stable version)
LICENSE=	lgpl

USE_PERL5=	yes
USE_XORG=	x11 ice xext sm inputproto xi xpm
USE_GNOME=	glib12
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--includedir=${PREFIX}/include/gtk12 --with-native-locale \
		--with-xinput=xfree
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		X_CFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"
.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

INFO=		gdk gtk
MAN1=		gtk-config.1

pre-build:
	${RM} -rf ${WRKSRC}/docs/gtk.info*

post-install:
	@${MKDIR} ${PREFIX}/lib/gtk/themes/engines
	@cd ${PREFIX}/bin && ${LN} -sf gtk-config gtk12-config
.for lib in gdk gtk
	@${RM} ${PREFIX}/lib/lib${lib}.la ${PREFIX}/lib/lib${lib}.so
	@${MV} ${PREFIX}/lib/lib${lib}.a ${PREFIX}/lib/lib${lib}-12.a
.endfor

.include <bsd.port.mk>
