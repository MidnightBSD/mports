# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-dictionary/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-dictionary
PORTVERSION=	3.26.1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 3 dictionary lookup application

LICENSE=gpl2 lgpl2.1
LICENSE_COMB=		multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.libs

BUILD_DEPENDS=	itstool:textproc/itstool \
		docbook-xsl>=0:textproc/docbook-xsl

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig tar:xz
USE_GNOME=	cairo gtk30 introspection:build libxslt:build
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes

GLIB_SCHEMAS=	org.gnome.dictionary.gschema.xml

.include <bsd.port.mk>
