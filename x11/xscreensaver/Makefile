PORTNAME=	xscreensaver
DISTVERSION=	6.06
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	http://www.jwz.org/xscreensaver/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Save your screen while you entertain your cat
WWW=		https://www.jwz.org/xscreensaver/

LICENSE=	mit

RUN_DEPENDS=	giftopnm:graphics/netpbm \
		p5-libwww>0:www/p5-libwww \
		p5-LWP-Protocol-https>0:www/p5-LWP-Protocol-https \
		unix-selfauth-helper>0:security/unix-selfauth-helper
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libgle.so:graphics/gle \
		libharfbuzz.so:print/harfbuzz

USES=		autoreconf cpe gettext gl gmake gnome jpeg localbase:ldflags \
		perl5 pkgconfig xorg
USE_GL=		gl glu
USE_GNOME=	cairo gdkpixbuf gtk30 intltool libxml2
USE_PERL5=	run
USE_XORG=	ice sm x11 xext xft xi xinerama xmu xrandr xrender xt xxf86vm
CPE_VENDOR=	xscreensaver_project

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	PERL="${PERL}"
CONFIGURE_ARGS=	--enable-locking \
		--with-app-defaults=${PREFIX}/lib/X11/app-defaults/ \
		--with-configdir=${PREFIX}/share/xscreensaver/config/ \
		--with-dpms-ext \
		--with-gl \
		--with-gle \
		--with-gtk \
		--with-hackdir=${PREFIX}/bin/xscreensaver-hacks/ \
		--with-jpeg=${LOCALBASE} \
		--with-pam \
		--with-pixbuf \
		--with-randr-ext \
		--with-xdbe-ext \
		--with-xf86gamma-ext \
		--with-xf86vmode-ext \
		--with-xft \
		--with-xinerama-ext \
		--with-xshm-ext \
		--without-kerberos \
		--without-shadow
MAKE_ARGS+=	install_prefix=${FAKE_DESTDIR}
MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=		FIREF NLS NSFW SETUID_HACKS XAOS1 XDALI XEARTH \
			XMOUN XPLANET XSNOW
OPTIONS_SUB=		yes

SETUID_HACKS_DESC=	Install sonar hack suid so it can ping
SETUID_HACKS_CONFIGURE_WITH=	setuid-hacks

FIREF_DESC=		Add extra port x11/fireflies
FIREF_RUN_DEPENDS=	${LOCALBASE}/bin/xscreensaver-hacks/fireflies:x11/fireflies

NLS_USES=		gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

NSFW_DESC=		Include material that is Not Safe For Work

XAOS1_DESC=		Add extra port graphics/xaos
XAOS1_RUN_DEPENDS=	xaos:graphics/xaos

XDALI_DESC=		Add extra port x11-clocks/xdaliclock
XDALI_RUN_DEPENDS=	xdaliclock:x11-clocks/xdaliclock

XEARTH_DESC=		Add extra port astro/xearth
XEARTH_RUN_DEPENDS=	xearth:astro/xearth

XMOUN_DESC=		Add extra port graphics/xmountains
XMOUN_RUN_DEPENDS=	xmountains:graphics/xmountains

XPLANET_DESC=		Add extra port astro/xplanet
XPLANET_RUN_DEPENDS=	xplanet:astro/xplanet

XSNOW_DESC=		Add extra port x11/xsnow
XSNOW_RUN_DEPENDS=	xsnow:x11/xsnow

SUB_FILES=	xscreensaver-blank.desktop xscreensaver-lock.desktop \
		xscreensaver-start.desktop xscreensaver-stop.desktop \
		xscreensaver.pam

post-patch:
	${REINPLACE_CMD} -e 's|/usr/X11R6|${LOCALBASE}|g' \
			-e 's|pkg_config --list-all|pkg_config --help|' \
			${WRKSRC}/configure.ac
	${REINPLACE_CMD} -e "s|/etc/pam.d|${PREFIX}/etc/pam.d|g" \
		${WRKSRC}/driver/passwd-pam.c \
		${WRKSRC}/driver/xscreensaver.man

post-patch-NSFW-off:
	${REINPLACE_CMD} -e 's|Dick Pix|Stuff|' ${WRKSRC}/hacks/bsod.c
	${REINPLACE_CMD} -e 's|dick pics|data, etc.|' ${WRKSRC}/hacks/bsod.c

post-install:
	${INSTALL_DATA} ${FILESDIR}/x*.xml ${STAGEDIR}${DATADIR}/config/
	${INSTALL_DATA} ${WRKDIR}/*.desktop ${STAGEDIR}${PREFIX}/share/applications/
	-${RM} ${STAGEDIR}${PREFIX}/etc/pam.d/xscreensaver.pam
	${INSTALL_DATA} ${WRKDIR}/xscreensaver.pam ${STAGEDIR}${PREFIX}/etc/pam.d/xscreensaver

.include <bsd.port.mk>
