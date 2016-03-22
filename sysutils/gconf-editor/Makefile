# $MidnightBSD$
# $FreeBSD: ports/sysutils/gconf-editor/Makefile,v 1.42 2007/08/27 17:33:13 marcus Exp $

PORTNAME=	gconf-editor
PORTVERSION=	2.32.0
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A gconf database editor for the GNOME 2 environment

LICENSE=	gpl2

USES=		gettext gmake tar:bzip2
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix intlhack libgnomeui gnomedocutils
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	gconf-editor.schemas

.include <bsd.port.mk>
