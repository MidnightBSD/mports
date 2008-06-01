# New ports collection makefile for:	gnome-menus
# Date created:				30 November 2004
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-menus/Makefile,v 1.2 2008/03/19 02:06:26 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-menus/Makefile,v 1.13 2007/07/03 06:59:12 marcus Exp $
#   $MCom: ports/x11/gnome-menus/Makefile,v 1.50 2007/03/12 22:36:46 marcus Exp $
#

PORTNAME=	gnome-menus
PORTVERSION=	2.22.1
CATEGORIES=	x11 gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the FreeDesktop Desktop Menu Spec
LICENSE=	gpl2

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_XORG=	x11
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack glib20 ltverhack
USE_AUTOTOOLS=	libtool:15
USE_PYTHON=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|applications.menu||' \
		${WRKSRC}/layout/Makefile.in
	@${REINPLACE_CMD} -e 's|applications.menu|gnome-applications.menu|' \
		${WRKSRC}/util/test-menu-spec.c
	@${REINPLACE_CMD} -e 's|/usr/share/gnome|${LOCALBASE}/share/gnome|g' \
		${WRKSRC}/layout/applications.menu \
		${WRKSRC}/layout/settings.menu
	@${SED} -e 's|/usr/local|${LOCALBASE}|g' \
		< ${FILESDIR}/KDE.directory > ${WRKSRC}/KDE.directory
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/simple-editor/GMenuSimpleEditor/menutreemodel.py

post-install:
	@${MKDIR} ${PREFIX}/share/desktop-directories
	@${INSTALL_DATA} ${WRKSRC}/layout/applications.menu \
		${PREFIX}/etc/xdg/menus/gnome-applications.menu
	@${INSTALL_DATA} ${WRKSRC}/KDE.directory \
		${PREFIX}/share/desktop-directories

.include <bsd.port.post.mk>
