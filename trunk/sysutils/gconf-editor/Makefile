# $MidnightBSD: mports/sysutils/gconf-editor/Makefile,v 1.5 2010/12/31 03:51:59 laffer1 Exp $
# $FreeBSD: ports/sysutils/gconf-editor/Makefile,v 1.42 2007/08/27 17:33:13 marcus Exp $

PORTNAME=	gconf-editor
PORTVERSION=	2.32.0
PORTEPOCH=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A gconf database editor for the GNOME 2 environment
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack libgnomeui gnomedocutils
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		gconf-editor.1
GCONF_SCHEMAS=	gconf-editor.schemas

.include <bsd.port.mk>
