PORTNAME=	wdm
PORTVERSION=	1.28
PORTREVISION=	9
CATEGORIES=	x11 windowmaker
MASTER_SITES=	http://freebsd.nsu.ru/distfiles/wdm/:wdm GENTOO:wdm \
		http://wolfram.schneider.org/bsd/gif/bsd/:pic_large \
		FREEBSD_LOCAL/tg:pic_small
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:wdm \
		beastie.xpm:pic_small \
		daemon1-HQ-1280x960.jpg:pic_large
DIST_SUBDIR=	wdm
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WINGs Display Manager; an xdm replacement

LICENSE=	gpl2

LIB_DEPENDS=	libWINGs.so:x11-wm/windowmaker

OPTIONS_DEFINE=	PAM
OPTIONS_DEFAULT=	PAM
OPTIONS_SUB=	yes

USES=		gettext localbase tar:bzip2 xorg
USE_XORG=	ice sm x11 xau xdmcp xext xinerama xmu
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	DEF_SERVER="${DEF_SERVER}" XRDB_PATH="${XRDB_PATH}"
CONFIGURE_ARGS=	--with-logdir=/var/log \
		--with-runlockdir=/var/run \
		--with-wdmdir=${WDMDIR} \
		--with-gfxdir=${WDMDIR}/pixmaps \
		--with-nlsdir=${PREFIX}/share/locale \
		--with-Logo=beastie.xpm \
		--with-gfx-incs=${LOCALBASE}/include \
		--with-gfx-libs=${LOCALBASE}/lib \
		--with-defuserpath=/bin:/usr/bin:/sbin:/usr/sbin:${LOCALBASE}/bin \
		--with-defsystempath=/bin:/usr/bin:/sbin:/usr/sbin:${LOCALBASE}/bin \
		--with-wmlist=wmaker:afterstep:blackbox:ctwm:enlightenment:fvwm:fvwm2:fvwm95:olvwm:qvwm:tvtwm

CPPFLAGS+=	-DCSRG_BASED -DHAS_SETUSERCONTEXT
LIBS+=		-lintl

DEF_SERVER?=	${LOCALBASE}/bin/X
XRDB_PATH?=	${LOCALBASE}/bin/xrdb

WDMDIR=		${PREFIX}/lib/X11/wdm

PAM_CONFIGURE_OFF=	--disable-pam
PAM_CONFIGURE_ON=	--with-pamdir=${LOCALBASE}/etc/pam.d/

post-patch:
	@${REINPLACE_CMD} -e \
		's|/usr/X11R6|${PREFIX}|g' ${WRKSRC}/configs/KillConsole
	@${REINPLACE_CMD} -e \
		's|/usr/X11R6|${PREFIX}|g' ${WRKSRC}/configs/Xclients.in
	@${REINPLACE_CMD} -e \
		's|/usr/X11R6|${PREFIX}|g' ${WRKSRC}/configs/Xsession.in
	@${REINPLACE_CMD} -e \
		's|$$(DESTDIR)$$(PAMDIR)/wdm||g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|-ldl||g ; \
		 s|/authdir||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		's|@FAILSAFE@|@FAILSAFE_PATH@|g' ${WRKSRC}/configs/Xsession.in
	@${REINPLACE_CMD} -e \
		's|#configdir#|${WDMDIR}|g' ${WRKSRC}/doc/wdm.man.in
	@${REINPLACE_CMD} -e \
		's|/etc/X11/wdm|${WDMDIR}|g' ${WRKSRC}/doc/wdmLogin.man

post-install:
	@${MV} ${STAGEDIR}${WDMDIR}/wdm-config ${WDMDIR}/wdm-config.sample
	@${MV} ${STAGEDIR}${WDMDIR}/Xsetup_0 ${WDMDIR}/Xsetup_0.sample
.for file in beastie.xpm daemon1-HQ-1280x960.jpg
	@${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/${file} ${WDMDIR}/pixmaps
.endfor
	${INSTALL_DATA} ${FILESDIR}/wdm.pam ${PREFIX}/etc/pam.d/wdm

.include <bsd.port.mk>
