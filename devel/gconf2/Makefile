# $MidnightBSD$

PORTNAME=	gconf2
PORTVERSION=	3.2.6
PORTREVISION=	4
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME/sources/GConf/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	GConf-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration database system for GNOME

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	libdbus-glib-1.so:devel/dbus-glib \
		libpolkit-gobject-1.so:sysutils/polkit

USES+=		gettext gmake gnome libtool pathfix pkgconfig python:run \
		shebangfix
USE_GNOME=	orbit2 gtk20 libxml2 \
		referencehack intlhack dconf introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--with-gtk=2.0 \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
SHEBANG_FILES=	gsettings/gsettings-schema-convert

DOCSDIR=	${PREFIX}/share/doc/gconf

OPTIONS_DEFINE=	LDAP DOCS
OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MLDAP}
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--with-openldap
PLIST_SUB+=	LDAP=""
.else
CONFIGURE_ARGS+=--without-openldap
PLIST_SUB+=	LDAP="@comment "
.endif

post-install:
	@${MKDIR} ${PREFIX}/etc/gconf/gconf.xml.system

.include <bsd.port.mk>

.endif
