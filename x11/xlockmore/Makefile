PORTNAME=	xlockmore
PORTVERSION=	5.71
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://www.sillycycle.com/xlock/ \
		SF/bsdsrc/${.CURDIR:T}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Like XLock session locker/screen saver, but just more
WWW=		https://sillycycle.com/xlockmore.html

LICENSE=	bsd2

LIB_DEPENDS=	libfreetype.so:print/freetype2

USES=		cpe tar:xz xorg
USE_XORG=	ice sm x11 xaw xext xpm xorgproto

CPE_VENDOR=	sillycycle

CONFIGURE_ARGS=	--without-motif --without-editres \
		--without-dtsaver --without-rplay --without-nas \
		--without-gtk --without-esound --disable-setuid \
		--disable-kerberos4 --without-ttf
GNU_CONFIGURE=	yes
PORTDOCS=	README ${PORTNAME}.README

OPTIONS_DEFINE=	MESAGL MB SYSLOG DISABLE_ALLOW_ROOT NICE_ONLY BLANK_ONLY \
		KERBEROS5 BAD_PAM GTK2 TIME_BOMB CUSTOMIZATION MAGICK JP \
		XINERAMA DOCS
OPTIONS_RADIO=	ONE
OPTIONS_RADIO_ONE=	PAM XLOCK_GROUP
OPTIONS_DEFAULT=	MB XINERAMA
OPTIONS_SUB=	yes

MESAGL_DESC=	Mesa 3D (for GL modes)
MB_DESC=	Xmb function series
SYSLOG_DESC=	Syslog logging
DISABLE_ALLOW_ROOT_DESC=	Allows users to turn off allowroot
NICE_ONLY_DESC=	Only low cpu modes
BLANK_ONLY_DESC=	Blank mode only (boring)
BAD_PAM_DESC=	Xlock will ask PAM with root rights
GTK2_DESC=	Build Gtk2 graphical shell
XLOCK_GROUP_DESC=	Allow xlock group to logout
TIME_BOMB_DESC=	Allow autologout
CUSTOMIZATION_DESC=	Allow tune through resource file
JP_DESC=	Japanese Language Support

NO_OPTIONS_SORT=	yes

MAKE_ARGS+=	bindir=${PREFIX}/bin \
		mandir=${PREFIX}/share/man/man1 \
		datarootdir=${PREFIX}/share \
		xapploaddir=${PREFIX}/lib/X11/app-defaults

KERBEROS5_CFLAGS=	${GSSAPICPPFLAGS}
KERBEROS5_CONFIGURE_ENV=	XLOCKLIBS="${GSSAPILDFLAGS} ${GSSAPILIBS} -lcom_err"
KERBEROS5_CONFIGURE_ENABLE=	kerberos5
KERBEROS5_USES=		gssapi:mit
MESAGL_CFLAGS=	-I${LOCALBASE}/include/FTGL -I${LOCALBASE}/include/freetype2
MESAGL_CONFIGURE_ENV=	XLOCKLIBS+="-lpthread"
MESAGL_CONFIGURE_WITH=	mesa opengl ftgl
MESAGL_LIB_DEPENDS=	libftgl.so:graphics/ftgl
MESAGL_USES=	gl
MESAGL_USE=	gl=gl,glu
BAD_PAM_CONFIGURE_ENABLE=	bad-pam
PAM_CONFIGURE_ENABLE=	pam
NICE_ONLY_CONFIGURE_ENABLE=	nice-only
BLANK_ONLY_CONFIGURE_ENABLE=	blank-only
MB_CONFIGURE_ENABLE=	mb
SYSLOG_CONFIGURE_ENABLE=	syslog
XINERAMA_CONFIGURE_WITH=	xinerama
XINERAMA_USE=	xorg=xinerama
DISABLE_ALLOW_ROOT_CONFIGURE_ON=	--disable-allow-root
XLOCK_GROUP_CONFIGURE_ENABLE=	xlock-group
TIME_BOMB_CONFIGURE_ENABLE=		bomb
CUSTOMIZATION_CONFIGURE_ENABLE=	customization
JP_IMPLIES=	MB
JP_CATEGORIES=	japanese
JP_VARS=	XLOCKMORE_LANG=ja
MAGICK_CONFIGURE_WITH=	magick
MAGICK_USES=		magick:6
MAGICK_LIB_DEPENDS=	libpng.so:graphics/png
GTK2_CONFIGURE_WITH=	gtk2
GTK2_LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
			libpng.so:graphics/png
GTK2_USE=	gnome=cairo,gdkpixbuf,gtk20
GTK2_USES=	gnome pkgconfig

.include <bsd.mport.options.mk>

.if defined(XLOCKMORE_LANG)
CONFIGURE_ARGS+=	--with-lang=${XLOCKMORE_LANG}
.endif

.if ${PORT_OPTIONS:MPAM} && empty(PORT_OPTIONS:MBAD_PAM)
pre-extract:
	@${ECHO}
	@${ECHO} "You have enabled PAM support. If you want to authenticate against"
	@${ECHO} "root only accessible PAM modules then define WITH_BAD_PAM=yes also."
	@${ECHO} "For example, pam_unix requires root rights to access shadow passwords."
	@${ECHO}
.endif

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/Revisions ${FAKE_DESTDIR}${DOCSDIR}/${PORTNAME}.README
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
