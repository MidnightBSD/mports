# $MidnightBSD$

PORTNAME=	gnome-user-share
PORTVERSION=	3.14.0
PORTREVISION=	2
CATEGORIES=	www deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Personal file-sharing service for the GNOME Desktop
LICENSE=	gpl2

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libavahi-client.so:net/avahi-app \
		libnotify.so:devel/libnotify \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libunique-1.0.so:x11-toolkits/unique
RUN_DEPENDS=	${LOCALBASE}/${APACHEMODDIR}/mod_dnssd.so:www/mod_dnssd \
		console-kit-daemon:sysutils/consolekit2

USES=		gettext gmake libtool pkgconfig tar:xz
USE_APACHE=	22+
USE_XORG=	sm
USE_GNOME=	gnomeprefix gtk30 intlhack nautilus3
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	--with-modules-path=${LOCALBASE}/${APACHEMODDIR} \
		--disable-bluetooth
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.desktop.file-sharing.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/httpd/modules|${LOCALBASE}/${APACHEMODDIR}|g' \
		${WRKSRC}/data/dav_user_*.conf

.include <bsd.port.mk>
