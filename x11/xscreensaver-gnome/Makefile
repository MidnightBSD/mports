# $MidnightBSD$

PORTNAME?=	xscreensaver-gnome
PORTVERSION=	5.12
PORTREVISION?=	5
CATEGORIES=	x11 gnome
MASTER_SITES=	http://www.jwz.org/xscreensaver/
DISTNAME=	xscreensaver-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Save your screen while you entertain your cat (for GNOME users)

LICENSE=	mit

#FAKE_OPTS+=	trueprefix
DESTDIRNAME=	install_prefix

LIB_DEPENDS=	libgle.so:${PORTSDIR}/graphics/gle

#CONFLICTS?=	xscreensaver-[0-9]* xscreensaver-gnome-hacks-[0-9]*

USE_XORG=	x11 xpm
USE_GL=		gl
USES+=		dos2unix gettext gmake jpeg perl5 pathfix pkgconfig
USE_PERL5_RUN=	yes
USE_GNOME=	libglade2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gtk --with-gl --with-gle --with-pixbuf --with-xpm \
		--with-jpeg=${LOCALBASE} --with-xshm-ext --with-xdbe-ext \
		--with-hackdir=${PREFIX}/bin/xscreensaver-hacks \
		--with-configdir=${PREFIX}/share/xscreensaver/config \
		--with-dpms-ext --with-xinerama-ext --with-xf86vmode-ext \
		--with-xf86gamma-ext --with-randr-ext --enable-locking \
		--with-x-app-defaults=${TRUE_PREFIX}/lib/X11/app-defaults
CONFIGURE_ENV=	LIBS="-lintl"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	PAM KEYRING ALL_FORTUNES SETUID_HACKS
OPTIONS_DEFAULT=	PAM KEYRING
KEYRING_DESC=		GnomeKeyring integration (needs PAM)
ALL_FORTUNES_DESC=	Support for all fortunes
SETUID_HACKS_DESC=	Install sonar hack suid so it can ping

SUB_FILES+=	xscreensaver.pam

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MALL_FORTUNES}
CONFIGURE_ARGS+=	--with-fortune="/usr/games/fortune -sa"
.endif

.if ${PORT_OPTIONS:MPAM} || ${PORT_OPTIONS:MKEYRING}
CONFIGURE_ARGS+=	--with-pam
PLIST_SUB+=		PAM=""
.else
CONFIGURE_ARGS+=	--without-pam
PLIST_SUB+=		PAM="@comment "
.endif

.if ${PORT_OPTIONS:MKEYRING}
SUB_LIST+=		PAM_KEYRING=
RUN_DEPENDS+=		${LOCALBASE}/lib/pam_gnome_keyring.so:${PORTSDIR}/security/gnome-keyring
.else
SUB_LIST+=		PAM_KEYRING=\#
.endif

.if ${PORT_OPTIONS:MSETUID_HACKS}
CONFIGURE_ARGS+=	--with-setuid-hacks
.endif

.if ${ARCH} == "amd64"
CFLAGS+=	-O0
.endif

USE_DOS2UNIX=	hacks/glx/topblock.c
pre-patch: dos2unix

post-patch:
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|g ; \
		s|/usr/X11R6|${LOCALBASE}|g' \
		${WRKSRC}/configure
.if ${PORT_OPTIONS:MPAM}
.for f in driver/passwd-pam.c driver/xscreensaver.man
	@${REINPLACE_CMD} -e 's|/etc/pam.d|${PREFIX}/etc/pam.d|g' \
	    	${WRKSRC}/${f}
.endfor
.else
	@${REINPLACE_CMD} -e 's|install-xml install-pam|install-xml|' \
	    	${WRKSRC}/driver/Makefile.in
.endif

pre-build:
	@(cd ${WRKSRC}/hacks && ./m6502.sh m6502.h images/m6502/*.asm)
	@(cd ${WRKSRC}/hacks/glx && ./molecules.sh molecules.h ../images/molecules/*.pdb)

pre-install:
.if ${PORT_OPTIONS:MPAM}
	@${CP} ${WRKDIR}/xscreensaver.pam ${WRKSRC}/driver/xscreensaver.pam
.endif

.if !target(post-install-slave)
post-install-slave:
	@${DO_NADA}
.endif

post-install: post-install-slave
	@(if test -x ${PREFIX}/bin/xscreensaver-hacks/webcollage-helper; then \
	    	${ECHO} "bin/xscreensaver-hacks/webcollage-helper" | \
			${CAT} - ${TMPPLIST} > ${TMPPLIST}.cat && \
			${MV} ${TMPPLIST}.cat ${TMPPLIST}; fi)

.include <bsd.port.post.mk>
