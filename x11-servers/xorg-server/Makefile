# $MidnightBSD: mports/x11-servers/xorg-server/Makefile,v 1.16 2011/08/27 19:49:56 laffer1 Exp $

PORTNAME=	xorg-server
PORTVERSION=	1.7.7
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	x11-servers
MASTER_SITES=	http://xorg.freedesktop.org/releases/individual/xserver/
DISTFILES=	xorg-server-${PORTVERSION}.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org X server and related programs
LICENSE=	mit

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm
RUN_DEPENDS=	${LOCALBASE}/share/X11/xkb/rules/base.xml:${PORTSDIR}/x11/xkeyboard-config

XORG_CAT=	xserver

USE_GMAKE=	yes
USE_GL=		gl
USE_XORG=	xf86driproto glproto xdmcp x11 xkbfile xxf86misc xxf86vm xaw7 \
		xmu xt xpm xext randrproto renderproto fixesproto damageproto \
		dri2proto xcmiscproto xextproto xproto xtrans xf86miscproto \
		xf86vidmodeproto xf86bigfontproto scrnsaverproto bigreqsproto \
		resourceproto fontsproto inputproto xf86dgaproto \
		videoproto compositeproto trapproto recordproto xineramaproto \
		xinerama evieproto xfont fontenc xkbui pixman pciaccess

MAKE_JOBS_UNSAFE=	yes
USE_OPENSSL=	yes
USE_PERL5_BUILD=yes
CONFIGURE_ARGS=	--disable-dmx --disable-xvfb --disable-xnest \
		--localstatedir=/var --without-dtrace --disable-xephyr \
		--enable-record=yes

MAN1=		Xorg.1 \
		Xserver.1 \
		cvt.1 \
		gtf.1
MAN4=		exa.4 \
		fbdevhw.4
MAN5=		xorg.conf.5

NOT_FOR_ARCHS=	alpha

.if !defined(ARCH)
ARCH!=	/usr/bin/uname -p
.endif

OPTIONS=	AIGLX	"Compile with Accelerated Indirect GLX support" on \
		SUID	"Install the Xorg server with setuid bit set" on
.if ${ARCH} == sparc64
OPTIONS+=	HAL	"Compile with HAL config support" off
.else
OPTIONS+=	HAL	"Compile with HAL config support" on
.endif

.include <bsd.port.pre.mk>

.if defined(WITH_OPENSSL_BASE)
# The reason why I use this is cause openssl from base doesn't install a .pc file
# and configure will fail trying to find it. Setting both of those variables to
# a *non-empty* value by-passes the pkg-config check.
CONFIGURE_ENV=	SHA1_LIB="-L/usr/lib -lcrypto" SHA1_CFLAGS="-I/usr/include"
.endif

.if !defined(WITHOUT_HAL)
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
CONFIGURE_ARGS+=	--enable-config-hal=yes
.else
CONFIGURE_ARGS+=	--enable-config-hal=no
.endif

.if !defined(WITHOUT_AIGLX)
CONFIGURE_ARGS+=	--enable-aiglx=yes
.else
CONFIGURE_ARGS+=	--enable-aiglx=no
.endif

.if !defined(WITHOUT_SUID) && (!defined(NO_SUID_XSERVER) || ${NO_SUID_XSERVER} == NO)
CONFIGURE_ARGS+=--enable-install-setuid=yes
.else
CONFIGURE_ARGS+=--enable-install-setuid=no
.endif

.if ${ARCH} == sparc64
PLIST_SUB+=	SPARC64=""
PLIST_SUB+=	SPARC64_NA="@comment "
.else
PLIST_SUB+=	SPARC64="@comment "
PLIST_SUB+=	SPARC64_NA=""
.endif

.if !defined(WITHOUT_SUID) && (!defined(NO_SUID_XSERVER) || ${NO_SUID_XSERVER} == NO)
pre-everything::
	@${ECHO_MSG} "By default, the X Server installs as a set-user-id root binary. When run by"
	@${ECHO_MSG} "a normal user, it checks arguments and environment as done in the x11/wrapper"
	@${ECHO_MSG} "port before handling them normally.  If you are concerned about the security"
	@${ECHO_MSG} "of this, but still want to run an X Server (for example using xdm/kdm/gdm,"
	@${ECHO_MSG} "which will still run the server as root), you can cancel the build and set"
	@${ECHO_MSG} "NO_SUID_XSERVER=YES in /etc/make.conf."
.endif

.include <bsd.port.post.mk>
