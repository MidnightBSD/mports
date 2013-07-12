# $MidnightBSD: mports/audio/pulseaudio/Makefile,v 1.7 2012/12/20 03:01:21 laffer1 Exp $

PORTNAME=	pulseaudio
PORTVERSION=	0.9.23
CATEGORIES=	audio
MASTER_SITES=	http://freedesktop.org/software/pulseaudio/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound server for UNIX
LICENSE=	gpl2

LIB_DEPENDS=	samplerate.1:${PORTSDIR}/audio/libsamplerate \
		sndfile.1:${PORTSDIR}/audio/libsndfile \
		speexdsp.1:${PORTSDIR}/audio/speex \
		dbus-1.3:${PORTSDIR}/devel/dbus \
		gdbm.4:${PORTSDIR}/databases/gdbm \
		execinfo:${PORTSDIR}/devel/libexecinfo \
		ck-connector.0:${PORTSDIR}/sysutils/consolekit

USE_GNOME=	gnomehack glib20 intltool ltverhack
USE_XORG=	x11 sm xtst ice
USE_LDCONFIG=	yes
USES=		gettext
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libltdl libtool
USE_GMAKE=	yes
MAKE_JOBS_UNSAFE=yes
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" \
		OPENSSL_CFLAGS="-I/usr/include" \
		OPENSSL_LIBS="-lcrypto -lssl" \
		LIBS="-lm -lintl" \
		ac_cv_header_linux_input_h=
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.if ${CC} == clang
CFLAGS+=	-fheinous-gnu-extensions
.endif

CONFIGURE_ARGS=	--localstatedir=/var \
		--with-database=gdbm \
		--without-caps \
		--disable-alsa \
		--disable-udev \
		--disable-gtk2 \
		--disable-lirc # untested

USERS=		pulse
GROUPS=		pulse pulse-access pulse-rt

OPTIONS_DEFINE=	JACK AVAHI HAL GCONF
OPTIONS_DEFAULT=	AVAHI HAL GCONF

PULSE_VERSION=	${PORTVERSION}
PLIST_SUB=	PULSE_VERSION=${PULSE_VERSION}

MAN1=		esdcompat.1 pabrowse.1 pacat.1 pacmd.1 pactl.1 padsp.1 \
		paplay.1 pasuspender.1 pax11publish.1 pulseaudio.1
MAN5=		default.pa.5 pulse-client.conf.5 pulse-daemon.conf.5

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MJACK}
LIB_DEPENDS+=	jack.0:${PORTSDIR}/audio/jack
PLIST_SUB+=	JACK=""
.else
PLIST_SUB+=	JACK="@comment "
CONFIGURE_ARGS+=--disable-jack
.endif

.if ${PORT_OPTIONS:MAVAHI}
LIB_DEPENDS+=	avahi-client.3:${PORTSDIR}/net/avahi-app
PLIST_SUB+=	AVAHI=""
.else
CONFIGURE_ARGS+=--disable-avahi
PLIST_SUB+=	AVAHI="@comment "
.endif

.if ${PORT_OPTIONS:MHAL}
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
PLIST_SUB+=	HAL=""
.else
CONFIGURE_ARGS+=--disable-hal
PLIST_SUB+=	HAL="@comment "
.endif

.if ${PORT_OPTIONS:MGCONF}
USE_GNOME+=	gconf2
PLIST_SUB+=	GCONF=""
.else
CONFIGURE_ARGS+=--disable-gconf
PLIST_SUB+=	GCONF="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/src/daemon/default.pa.in
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

post-install:
	${MKDIR} ${PREFIX}/etc/pulse
.for ii in default.pa daemon.conf client.conf system.pa
	${INSTALL_DATA} ${WRKSRC}/src/${ii} \
		${PREFIX}/etc/pulse/${ii}-dist
. if !exists(${PREFIX}/etc/pulse/${II})
	${INSTALL_DATA} ${WRKSRC}/src/${ii} \
		${PREFIX}/etc/pulse/${ii}
. endif
.endfor

.include <bsd.port.post.mk>
