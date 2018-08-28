# $MidnightBSD$
# $FreeBSD: ports/devel/glade3/Makefile,v 1.9 2008/01/13 17:30:53 kwm Exp $
#   $MCom: ports/devel/glade3/Makefile,v 1.38 2007/09/17 15:59:36 ahze Exp $

PORTNAME=	glade3
PORTVERSION=	3.8.5
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User interface builder for GTK+/GNOME

LICENSE=	gpl2

INSTALLS_ICONS=	yes
USE_GNOME=	gtk20 intltool libxml2 gnomedocutils
USES=		gmake gettext libtool pathfix desktop-file-utils pkgconfig tar:xz
INSTALLS_OMF=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

DOCSDIR=	${PREFIX}/share/doc/gladeui

OPTIONS_DEFINE=	GNOME PYTHON
OPTIONS_DEFAULT=PYTHON
GNOME_DESC=	GNOME UI widget support
OPTIONS_SUB=	yes

GNOME_CONFIGURE_ENABLE=	gnome
GNOME_USE=	GNOME=libgnomeui
PYTHON_CONFIGURE_ENABLE=	python
PYTHON_USE=	GNOME=pygtk2
PUTHON_USES=	python:2

post-install:
	${MKDIR} ${PREFIX}/lib/glade3/bindings

.include <bsd.port.mk>
