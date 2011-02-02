# New ports collection makefile for:	gedit-plugins
# Date created:				19 September 2003
# Whom:					Adam Weinberger <adamw@FreeBSD.org>
#
# $MidnightBSD: mports/editors/gedit-plugins/Makefile,v 1.5 2010/01/23 22:12:12 laffer1 Exp $
# $FreeBSD: ports/editors/gedit-plugins/Makefile,v 1.21 2007/10/24 23:35:36 marcus Exp $
#   $MCom: ports/editors/gedit-plugins/Makefile,v 1.24 2007/09/30 17:15:47 mezz Exp $
#

PORTNAME=	gedit-plugins
PORTVERSION=	2.26.3
CATEGORIES=	editors gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plugins for GEdit 2
LICENSE=	gpl2

BUILD_DEPENDS=	gedit:${PORTSDIR}/editors/gedit \
		gucharmap:${PORTSDIR}/deskutils/gucharmap
RUN_DEPENDS=	gedit:${PORTSDIR}/editors/gedit \
		gucharmap:${PORTSDIR}/deskutils/gucharmap

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_XLIB=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack gnomeprefix intlhack gnomevfs2
WANT_GNOME=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gedit-show-tabbar-plugin.schemas

EXTENSIONS=	python

.if defined(PACKAGE_BUILDING)
.undef WITHOUT_GNOME
WITH_GNOME=	yes
.endif

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mpygtksourceview}!="" && ${ARCH}!="sparc64"
USE_PYTHON=	yes
USE_GNOME+=	pygtksourceview
BUILD_DEPENDS+=	${PYTHON_SITELIBDIR}/gtk-2.0/vtemodule.so:${PORTSDIR}/x11-toolkits/py-vte
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/gtk-2.0/vtemodule.so:${PORTSDIR}/x11-toolkits/py-vte
CONFIGURE_ARGS+=--enable-python
PLIST_SUB+=	PYTHON=""
.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's| \\t\\r\\n\\f|[:space:]|g' \
	    	${WRKSRC}/configure

.include <bsd.port.post.mk>
