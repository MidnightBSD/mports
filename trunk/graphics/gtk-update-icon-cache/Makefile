# $MidnightBSD$

PORTNAME=	gtk-update-icon-cache
PORTVERSION=	2.24.22
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gtk+/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	gtk+-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	gtk-update-icon-cache utility from the Gtk+ toolkit.

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS+=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info \
		${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USES=		gettext gmake libtool:keepla pathfix perl5 pkgconfig tar:xz
USE_PERL5=	build
MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	atk pango gdkpixbuf2 introspection:build
USE_XORG=	xext xrender x11 xinerama xi xrandr xcursor xfixes xdamage \
		xcomposite
PATCHDIR=	${.CURDIR}/../../x11-toolkits/gtk20/files
CONFIGURE_ARGS=	--enable-static --with-xinput=yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
BUILD_WRKSRC=	${WRKSRC}/gtk
ALL_TARGET=	${PORTNAME}
PLIST_FILES=	bin/gtk-update-icon-cache \
		man/man1/gtk-update-icon-cache.1.gz

.include <bsd.port.pre.mk>

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/gtk/gtk-update-icon-cache \
		${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/docs/reference/gtk/gtk-update-icon-cache.1 \
		${PREFIX}/man/man1/

.include <bsd.port.post.mk>
