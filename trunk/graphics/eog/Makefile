# $MidnightBSD: mports/graphics/eog/Makefile,v 1.4 2008/06/01 20:28:52 crash Exp $

PORTNAME=	eog
PORTVERSION=	2.26.2
CATEGORIES=	graphics gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME:S/2$//}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Eye Of Gnome image viewer
LICENSE=	gpl2

BUILD_DEPENDS=	update-mime-database:${PORTSDIR}/misc/shared-mime-info
LIB_DEPENDS=	lcms.1:${PORTSDIR}/graphics/lcms

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack  \
		librsvg2 desktopfileutils gnomedesktop
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
GNOME_DESKTOP_VERSION=2
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	eog.schemas

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_EXIF) || (exists(${LOCALBASE}/lib/libexif.so.12) || \
	defined(WITH_EXIF))
LIB_DEPENDS+=	exif.12:${PORTSDIR}/graphics/libexif
.endif

.if ${HAVE_GNOME:Mpygnome2}!=""
USE_GNOME+=   pygnome2
CONFIGURE_ARGS+=--enable-python
.else
CONFIGURE_ARGS+=--disable-python
.endif

post-install:
	@-update-desktop-database > /dev/null

.include <bsd.port.post.mk>
