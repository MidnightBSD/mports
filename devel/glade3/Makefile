# New ports collection makefile for:	glade3
# Date created:		Sun May 22 17:22:53 CEST 2005
# Whom:			Koop Mast <kwm@FreeBSD.org>
#
# $MidnightBSD: mports/devel/glade3/Makefile,v 1.6 2011/02/02 20:17:32 laffer1 Exp $
# $FreeBSD: ports/devel/glade3/Makefile,v 1.9 2008/01/13 17:30:53 kwm Exp $
#   $MCom: ports/devel/glade3/Makefile,v 1.38 2007/09/17 15:59:36 ahze Exp $
#

PORTNAME=	glade3
PORTVERSION=	3.7.3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A user interface builder for GTK+/GNOME
LICENSE=	gpl2

INSTALLS_ICONS=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnometarget gtk20 libxml2 gnomeprefix gnomehack \
		gnomedocutils desktopfileutils ltverhack:10
WANT_GNOME=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"

DOCSDIR=	${PREFIX}/share/doc/gladeui

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mlibgnomeui}!=""
USE_GNOME+=	libgnomeui
CONFIGURE_ARGS+=--enable-gnome
PKGNAMESUFFIX:=	${PKGNAMESUFFIX}-gnome
.else
CONFIGURE_ARGS+=--disable-gnome
.endif

#.if ${HAVE_GNOME:Mpygtk2}!=""
#USE_PYTHON=	yes
#EXTENSIONS+=	python
#USE_GNOME+=	pygtk2
#PLIST_SUB+=	PYTHON:=""
#CONFIGURE_ARGS+=--enable-python
#.else
CONFIGURE_ARGS+=--disable-python
PLIST_SUB+=	PYTHON:="@comment "
#.endif

post-install:
	${MKDIR} ${PREFIX}/lib/glade3/bindings

.include <bsd.port.post.mk>
