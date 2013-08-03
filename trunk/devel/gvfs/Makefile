# $MidnightBSD: mports/devel/gvfs/Makefile,v 1.12 2012/03/06 02:11:20 laffer1 Exp $

PORTNAME=	gvfs
PORTVERSION=	1.12.3
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME virtual file system
LICENSE=	lgpl

LIB_DEPENDS=	dbus-1:${PORTSDIR}/devel/dbus \
		soup-gnome-2.4:${PORTSDIR}/devel/libsoup-gnome \
		gcrypt:${PORTSDIR}/security/libgcrypt \
		gnome-keyring:${PORTSDIR}/security/libgnome-keyring

USES=		gettext
USE_XZ=		yes
USE_GNOME=	glib20 gnomehack gnomeprefix intlhack intltool
USE_GMAKE=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-obexftp \
		--disable-bluray \
		--disable-afc

OPTIONS_DEFINE=	AVAHI SAMBA GPHOTO2 CDDA HAL FUSE
OPTIONS_DEFAULT=AVAHI SAMBA GPHOTO2 CDDA HAL
CDDA_DESC=	CDDA (enables HAL)
GPHOTO2_DESC=	Gphoto 2 camera support (enables HAL)
SAMBA_DESC=	Samba support

GLIB_SCHEMAS=	org.gnome.system.gvfs.enums.xml

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MFUSE}
USES+=		fuse
PLIST_SUB+=	FUSE=""
.else
CONFIGURE_ARGS+=	--disable-fuse
PLIST_SUB+=	FUSE="@comment "
.endif

.if ${PORT_OPTIONS:MSAMBA}
LIB_DEPENDS+=	smbclient:${PORTSDIR}/net/samba-libsmbclient
GLIB_SCHEMAS+=	org.gnome.system.smb.gschema.xml
PLIST_SUB+=	SMB=""
.else
CONFIGURE_ARGS+=	--disable-samba
PLIST_SUB+=	SMB="@comment "
.endif

.if ${PORT_OPTIONS:MCDDA}
LIB_DEPENDS+=	cdio_paranoia:${PORTSDIR}/sysutils/libcdio
PLIST_SUB+=	CDDA=""
.else
CONFIGURE_ARGS+=	--disable-cdda
PLIST_SUB+=	CDDA="@comment "
.endif

.if ${PORT_OPTIONS:MGPHOTO2}
LIB_DEPENDS+=	gphoto2:${PORTSDIR}/graphics/libgphoto2
PLIST_SUB+=	GPHOTO2=""
.else
CONFIGURE_ARGS+=	--disable-gphoto2
PLIST_SUB+=	GPHOTO2="@comment "
.endif

.if ${PORT_OPTIONS:MAVAHI}
LIB_DEPENDS+=	avahi-client:${PORTSDIR}/net/avahi-app
GLIB_SCHEMAS+=	org.gnome.system.dns_sd.gschema.xml
PLIST_SUB+=	AVAHI=""
.else
CONFIGURE_ARGS+=--disable-avahi
PLIST_SUB+=	AVAHI="@comment "
.endif

.if ${PORT_OPTIONS:MHAL} || ${PORT_OPTIONS:MGPHOTO2} || ${PORT_OPTIONS:MCDDA}
LIB_DEPENDS+=	hal:${PORTSDIR}/sysutils/hal
RUN_DEPENDS+=	gnome-mount:${PORTSDIR}/sysutils/gnome-mount
PLIST_SUB+=	HAL=""
.else
CONFIGURE_ARGS+=--disable-hal
PLIST_SUB+=	HAL="@comment "
.endif

.include <bsd.port.mk>
