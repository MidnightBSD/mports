# $MidnightBSD$

PORTNAME=	goffice
PORTVERSION=	0.8.17
PORTREVISION=	3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	08

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpcre.so:${PORTSDIR}/devel/pcre

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix intlhack gtk20 libgsf
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
PLIST_SUB=	VERSION=${PORTVERSION} \
		SHORT_VER=0.8

OPTIONS_DEFINE=	GCONF
OPTIONS_DEFAULT=GCONF

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGCONF}
USE_GNOME+=	gconf2
.else
CONFIGURE_ARGS+=--with-config-backend=keyfile
.endif

.include <bsd.port.mk>
