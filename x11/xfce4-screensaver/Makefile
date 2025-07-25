PORTNAME=	xfce4-screensaver
PORTVERSION=	4.18.4
PORTREVISION=	1
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE/apps
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xfce 4 screen saver and locker
WWW=		https://git.xfce.org/apps/xfce4-screensaver/about/

LICENSE=	gpl2 lgpl
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	xdt-csource:devel/xfce4-dev-tools
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libdbus-glib-1.so:devel/dbus-glib \
		libharfbuzz.so:print/harfbuzz \
		libxklavier.so:x11/libxklavier

USES=		compiler:c11 gettext-tools gl gmake gnome pkgconfig python \
		shebangfix tar:bzip2 xfce xorg
USE_GL=		gl
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 intltool libwnck3
USE_XFCE=	garcon xfconf
USE_XORG=	ice sm x11 xext xrandr xscrnsaver xxf86vm

SHEBANG_FILES=	src/xfce4-screensaver-configure.py
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-maintainer-mode \
		--with-console-kit=yes \
		--with-systemd=no

SCREENSAVER_DIR=	share/applications/screensavers

OPTIONS_DEFINE=		NLS PAM
OPTIONS_DEFAULT=	PAM
OPTIONS_SUB=		yes

NLS_USES=		gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

PAM_RUN_DEPENDS=	pam_helper:security/pam_helper
PAM_CONFIGURE_ON=	--enable-authentication-scheme=helper \
			--with-passwd-helper=${LOCALBASE}/bin/pam_helper
PAM_CONFIGURE_OFF=	--disable-pam

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug=yes
.endif

post-patch-PAM-on:
	@${REINPLACE_CMD} -e 's|/etc/pam.d|${PREFIX}/etc/pam.d|g' \
		${WRKSRC}/src/gs-auth-pam.c

post-install:
	${MKDIR} ${PREFIX}/${SCREENSAVER_DIR}
	@${REINPLACE_CMD} 's/^\(Name[^=]*=\)\(.*\)/\1XFCE \2/' ${PREFIX}/etc/xdg/autostart/xfce4-screensaver.desktop

post-install-PAM-on:
	${INSTALL_DATA} ${FILESDIR}/xfce4-screensaver.pam ${FAKE_DESTDIR}${PREFIX}/etc/pam.d/xfce4-screensaver.sample

.include <bsd.port.post.mk>
