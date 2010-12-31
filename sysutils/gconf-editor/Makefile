# New ports collection makefile for:	gconf-editor
# Date created:				12 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/gconf-editor/Makefile,v 1.4 2008/05/31 16:35:12 laffer1 Exp $
# $FreeBSD: ports/sysutils/gconf-editor/Makefile,v 1.42 2007/08/27 17:33:13 marcus Exp $
#   $MCom: ports/sysutils/gconf-editor/Makefile,v 1.59 2007/03/13 12:30:40 ahze Exp $
#

PORTNAME=	gconf-editor
PORTVERSION=	2.30.0
PORTEPOCH=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A gconf database editor for the GNOME 2 environment
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XLIB=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack libgnomeui gnomedocutils
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gconf-editor.1
GCONF_SCHEMAS=	gconf-editor.schemas

.include <bsd.port.mk>
