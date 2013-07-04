# $MidnightBSD: mports/graphics/gtk-update-icon-cache/Makefile,v 1.2 2013/02/19 12:20:45 laffer1 Exp $

PORTNAME=	gtk-update-icon-cache
PORTVERSION=	2.24.17
CATEGORIES=	graphics
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gtk+-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	gtk-update-icon-cache utility from the Gtk+ toolkit.
LICENSE=	lgpl

USE_XZ=		yes

BUILD_DEPENDS+=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection \
		${LOCALBASE}/libdata/pkgconfig/cairo-xlib.pc:${PORTSDIR}/graphics/cairo
RUN_DEPENDS+=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info \
		${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_GMAKE=	yes
USE_PERL5_BUILD=yes
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack atk pango gdkpixbuf2 ltverhack
USE_GETTEXT=	yes
USE_XORG=	xext xrender x11 xinerama xi xrandr xcursor xfixes xdamage \
		xcomposite
PATCHDIR=	${.CURDIR}/../../x11-toolkits/gtk20/files
CONFIGURE_ARGS=	--enable-static --with-xinput=yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
PLIST_FILES=	bin/gtk-update-icon-cache

MAN1=		gtk-update-icon-cache.1

.include <bsd.port.pre.mk>

pre-configure:
	@if [ ! -f ${LOCALBASE}/libdata/pkgconfig/cairo-xlib.pc ]; then \
		${ECHO_CMD} "${PKGNAME}: Needs cairo built with X11 support."; \
		${FALSE}; \
	fi

do-build:
	@cd ${WRKSRC}/gtk && ${GMAKE} gtk-update-icon-cache

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/gtk/gtk-update-icon-cache \
		${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/docs/reference/gtk/gtk-update-icon-cache.1 \
		${PREFIX}/man/man1/

.include <bsd.port.post.mk>
