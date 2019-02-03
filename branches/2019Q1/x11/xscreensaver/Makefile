# $MidnightBSD$

PORTNAME=	xscreensaver
PORTVERSION=	5.29
CATEGORIES=	x11
MASTER_SITES=	http://www.jwz.org/xscreensaver/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Save your screen while you entertain your cat

LICENSE=	mit

LIB_DEPENDS=	libgle.so:${PORTSDIR}/graphics/gle \
		libjpeg.so:${PORTSDIR}/graphics/jpeg

RUN_DEPENDS=	p5-libwww>0:${PORTSDIR}/www/p5-libwww \
		giftopnm:${PORTSDIR}/graphics/netpbm

DESTDIRNAME=	install_prefix

CONFLICTS=	xscreensaver-gnome-[0-9]* xscreensaver-gnome-hacks-[0-9]*

USES=		pkgconfig gettext gmake perl5
USE_AUTOTOOLS=	autoconf
USE_GL=		yes
USE_GNOME=	gdkpixbuf2 gtk20 intltool libglade2 libxml2
USE_PERL5=	run
USE_XORG=	xpm xext xxf86misc

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gtk --with-gl --with-gle --with-pixbuf --with-xpm \
		--with-jpeg=${LOCALBASE} --with-xshm-ext --with-xdbe-ext \
		--with-hackdir=${PREFIX}/bin/xscreensaver-hacks/ \
		--with-configdir=${PREFIX}/share/xscreensaver/config/ \
		--with-dpms-ext --with-xinerama-ext --with-xf86vmode-ext \
		--with-xf86gamma-ext --with-randr-ext --without-kerberos \
		--without-setuid-hacks --enable-locking

OPTIONS_DEFINE= PAM FIREF XAOS1 XDALI XURTH XMOUN XPLAN \
		XSNOW
SETUID_HACKS_DESC=	Install sonar hack suid so it can ping
FIREF_DESC=	Add extra port x11/fireflies
XAOS1_DESC=	Add extra port graphics/xaos
XDALI_DESC=	Add extra port x11-clocks/xdaliclock
XURTH_DESC=	Add extra port astro/xearth
XMOUN_DESC=	Add extra port graphics/xmountains
XPLAN_DESC=	Add extra port astro/xplanet
XSNOW_DESC=	Add extra port x11/xsnow

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPAM}
CONFIGURE_ARGS+=	--with-pam
PLIST_SUB+=		PAM=""
.else
CONFIGURE_ARGS+=	--without-pam
PLIST_SUB+=		PAM="@comment not installed: "
.endif

.if ${PORT_OPTIONS:MFIREF}
RUN_DEPENDS+=	${LOCALBASE}/bin/xscreensaver-hacks/fireflies:${PORTSDIR}/x11/fireflies
.endif
.if ${PORT_OPTIONS:MXAOS1}
RUN_DEPENDS+=	xaos:${PORTSDIR}/graphics/xaos
.endif
.if ${PORT_OPTIONS:MXDALI}
RUN_DEPENDS+=	xdaliclock:${PORTSDIR}/x11-clocks/xdaliclock
.endif
.if ${PORT_OPTIONS:MXURTH}
RUN_DEPENDS+=	xearth:${PORTSDIR}/astro/xearth
.endif
.if ${PORT_OPTIONS:MXMOUN}
RUN_DEPENDS+=	xmountains:${PORTSDIR}/graphics/xmountains
.endif
.if ${PORT_OPTIONS:MXPLAN}
RUN_DEPENDS+=	xplanet:${PORTSDIR}/astro/xplanet
.endif
.if ${PORT_OPTIONS:MXSNOW}
RUN_DEPENDS+=	xsnow:${PORTSDIR}/x11/xsnow
.endif

.undef HAVE_GNOME

SUB_FILES=	xscreensaver-blank.desktop xscreensaver-lock.desktop \
		xscreensaver-start.desktop xscreensaver-stop.desktop

post-patch:
	@ ${CP} ${WRKSRC}/configure ${WRKSRC}/configure.Patched
	@ ${SED} -e 's#-lpthread#${PTHREAD_LIBS}#g' \
		-e 's#malloc.h#stdlib.h#g' \
		-e 's#/usr/X11R6#${LOCALBASE}#g' \
		-e 's#pkg_config --list-all#pkg_config --help#' \
		${WRKSRC}/configure.Patched > ${WRKSRC}/configure
.if ${PORT_OPTIONS:MPAM}
.for f in driver/passwd-pam.c driver/xscreensaver.man
	@ ${CP} ${WRKSRC}/${f} ${WRKSRC}/${f}.presed
	@ ${SED} -e "s#/etc/pam.d#${PREFIX}/etc/pam.d#g" \
	    ${WRKSRC}/${f}.presed > ${WRKSRC}/${f}
.endfor
	@ ${CP} ${FILESDIR}/xscreensaver.pam \
	    ${WRKSRC}/driver/xscreensaver.pam.in
.else
	@ ${CP} ${WRKSRC}/driver/Makefile.in ${WRKSRC}/driver/Makefile.in.post
	@ ${SED} -e "s#install-xml install-pam#install-xml#" \
	    ${WRKSRC}/driver/Makefile.in.post > ${WRKSRC}/driver/Makefile.in
.endif

post-install:
	${INSTALL_DATA} ${FILESDIR}/x*.xml ${DATADIR}/config/
	@(if test -x ${LOCALBASE}/bin/xscreensaver-hacks/webcollage-helper; then \
		${ECHO} "bin/xscreensaver-hacks/webcollage-helper" | \
			${CAT} - ${TMPPLIST} > ${TMPPLIST}.cat && \
			${MV} ${TMPPLIST}.cat ${TMPPLIST}; fi)
	${INSTALL_DATA} ${WRKDIR}/*.desktop ${PREFIX}/share/applications/

.include <bsd.port.mk>
