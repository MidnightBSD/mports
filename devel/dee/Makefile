# Created by: Olivier Duchateau
# $FreeBSD: head/devel/dee/Makefile 387491 2015-05-26 16:47:02Z antoine $
# $MidnightBSD$

PORTNAME=	dee
PORTVERSION=	1.2.7
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://launchpadlibrarian.net/151383425/ \
	https://launchpad.net/${PORTNAME}/1.0/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Model to synchronize multiple instances over DBus

LICENSE=	gpl3

BUILD_DEPENDS=	vapigen:lang/vala
LIB_DEPENDS=	libicutu.so:devel/icu

USES=		gmake gnome libtool localbase pathfix pkgconfig python:2.7
GNU_CONFIGURE=	yes
USE_GNOME=	glib20 introspection:build pygobject3
USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--disable-gtk-doc-html \
	--disable-tests \
	--disable-gcov \
	--enable-introspection=yes \
	--without-html-dir

post-patch:
	${REINPLACE_CMD} -e 's| -Wempty-body||' ${WRKSRC}/configure

.include <bsd.port.mk>
