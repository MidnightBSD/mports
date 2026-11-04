PORTNAME=	libtomoe-gtk
PORTVERSION=	0.6.0
PORTREVISION=	12
CATEGORIES=	japanese
MASTER_SITES=	SF/tomoe/tomoe-gtk/tomoe-gtk-${PORTVERSION}
DISTNAME=	tomoe-gtk-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TOMOE GTK library
WWW=		http://tomoe.sourceforge.jp/

LIB_DEPENDS=	libtomoe.so:japanese/tomoe

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-python=no
USES=		gmake gnome libtool pathfix pkgconfig
USE_GNOME=	gtk20
USE_LDCONFIG=	yes

.include <bsd.mport.options.mk>

CONFIGURE_ARGS+=--with-gucharmap=no
PLIST_SUB+=	GUCHARMAP="@comment "

.include <bsd.port.mk>
