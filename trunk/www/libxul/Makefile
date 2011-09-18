# $MidnightBSD: mports/www/libxul/Makefile,v 1.2 2011/08/19 02:25:09 laffer1 Exp $
# $FreeBSD: ports/www/libxul/Makefile,v 1.28 2011/04/29 15:44:33 flo Exp $

PORTNAME=	libxul
DISTVERSION=	1.9.2.17
CATEGORIES?=	www devel
MASTER_SITES=	${MASTER_SITE_MOZILLA}
MASTER_SITE_SUBDIR=	xulrunner/releases/${DISTVERSION}/source
DISTNAME=	xulrunner-${DISTVERSION}.source

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Mozilla runtime package that can be used to bootstrap XUL+XPCOM apps
LICENSE=	agg
# Dual mpl/gpl2

WRKSRC=		${WRKDIR}/mozilla-1.9.2
CONFLICTS=	mozilla-[0-9]*
GECKO_PLIST_PRE_DIRS=	lib/${MOZILLA}/bin lib/${MOZILLA}/idl \
			lib/${MOZILLA}/include lib/${MOZILLA}/lib

USE_AUTOTOOLS=	autoconf213
WANT_GNOME=	yes
WANT_PERL=	yes
ALL_TARGET=	default
HAS_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
MAKE_ENV=	SKIP_GRE_REGISTRATION=1 mozappdir=${PREFIX}/lib/${MOZILLA}
LDFLAGS+=	-Wl,-rpath,${PREFIX}/lib/${MOZ_RPATH}
USE_LDCONFIG=	${PREFIX}/lib/${MOZILLA}
CONFIGURE_ARGS+=	--build=i386-portbld-freebsd7.0 \
			--host=i386-portbld-freebsd7.0 

PORT_MOZCONFIG=	${WRKSRC}/xulrunner/config/mozconfig
MOZ_OPTIONS?=	--with-default-mozilla-five-home=${PREFIX}/lib/${MOZILLA} \
		--disable-javaxpcom --enable-canvas \
		--enable-system-cairo --disable-updater \
		--disable-necko-wifi --disable-ipc
MOZ_EXTENSIONS=	default,cookie,permissions
OPTIONS=	# Empty, used for generic gecko OPTIONS
USE_GECKO_OPTIONS=	java debug logging optimized_cflags
USE_GECKO=	gecko
MOZILLA_EXEC_NAME=xulrunner
MOZ_TOOLKIT=	cairo-gtk2
USE_MOZILLA=	-png -nss -dbm -jpeg
MOZ_PKGCONFIG_FILES=	libxul-embedding libxul mozilla-gtkmozembed-embedding \
		mozilla-gtkmozembed mozilla-js mozilla-nss mozilla-plugin

OPTIONS=	DBUS "Enable D-BUS support" on

.include <bsd.port.pre.mk>

GECKO_PTHREAD_LIBS!=${CC} -dumpspecs | ${GREP} -m 1 '%{\!pg: %{pthread:' | ${SED} -e 's|^.*%{\!pg: %{pthread:|| ; s|}.*$$||' || ${TRUE}

.if ${OSVERSION} < 3000
LIB_DEPENDS+=	pulse.0:${PORTSDIR}/audio/pulseaudio
EXTRA_PATCHES=	${FILESDIR}/releng6_pulseaudio
.else
EXTRA_PATCHES=	${FILESDIR}/libsydney_oss
.endif

.if defined(WITHOUT_DBUS)
MOZ_OPTIONS+=	--disable-dbus --disable-libnotify
.else
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
		notify.1:${PORTSDIR}/devel/libnotify
.endif

post-patch:
	${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS:C/-pthread/${GECKO_PTHREAD_LIBS}/}|' \
	    	${WRKSRC}/storage/build/Makefile.in \
		${WRKSRC}/db/sqlite3/src/Makefile.in
	${REINPLACE_CMD} -e 's|/usr/local/include|${LOCALBASE}/include|' \
	    	${WRKSRC}/js/src/config/mkdepend/Makefile.in
	@${REINPLACE_CMD} -e 's|-lc_r|${PTHREAD_LIBS}|g ; \
		s|-lpthread|${PTHREAD_LIBS}|g ; \
		s|echo aout|echo elf|g ; \
		s|/usr/X11R6|${LOCALBASE}|g' \
		${WRKSRC}/js/src/configure
.if ${ARCH} == "sparc64"
	(cd ${WRKSRC}/xpcom/reflect/xptcall/src/md/unix && \
          ${LN} -s xptcstubs_asm_sparc64_openbsd.s xptcstubs_asm_sparc64_midnightbsd.s && \
          ${LN} -s xptcstubs_sparc64_openbsd.cpp xptcstubs_sparc64_midnightbsd.cpp && \
          ${LN} -s xptcinvoke_sparc64_openbsd.cpp xptcinvoke_sparc64_midnightbsd.cpp && \
          ${LN} -s xptcinvoke_asm_sparc64_openbsd.s xptcinvoke_asm_sparc64_midnightbsd.s)
	(cd ${WRKSRC}/xpcom/reflect/xptcall/src/md/unix && \
          ${LN} -s xptcstubs_asm_sparc64_openbsd.s xptcstubs_asm_sparc64_freebsd.s && \
          ${LN} -s xptcstubs_sparc64_openbsd.cpp xptcstubs_sparc64_freebsd.cpp && \
          ${LN} -s xptcinvoke_sparc64_openbsd.cpp xptcinvoke_sparc64_freebsd.cpp && \
          ${LN} -s xptcinvoke_asm_sparc64_openbsd.s xptcinvoke_asm_sparc64_freebsd.s)
.else
	( cd ${WRKSRC}/xpcom/reflect/xptcall/src/md/unix && \
          ${LN} -s xptcstubs_asm_amd64_openbsd.s xptcstubs_asm_amd64_midnightbsd.s && \
          ${LN} -s xptcstubs_amd64_openbsd.cpp xptcstubs_amd64_midnightbsd.cpp && \
          ${LN} -s xptcinvoke_amd64_openbsd.cpp xptcinvoke_amd64_midnightbsd.cpp && \
          ${LN} -s xptcinvoke_asm_amd64_openbsd.s xptcinvoke_asm_amd64_midnightbsd.s \
	)
	${REINPLACE_CMD} -e 's/NetBSD/MidnightBSD/g' ${WRKSRC}/xpcom/reflect/xptcall/src/md/unix/xptc_platforms_unixish_x86.h
.endif
	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD`${UNAME} -r`.mk
	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD${OSREL}.mk

pre-configure:
	(cd ${WRKSRC}/js/src/ && ${AUTOCONF})

post-build:
	@${REINPLACE_CMD} -e "s|\(Libs:.*\)\($$\)|\1 -Wl,-rpath,${TRUE_PREFIX}/lib/${MOZ_RPATH}\2| ; \
	    	s|%sdkdir%|%sdkdir%/sdk|g ; \
		s|%%MOZ_LIBDIR%%|${TRUE_PREFIX}/lib/${MOZILLA}|g" \
	    	${WRKSRC}/xulrunner/installer/*.pc.in || ${TRUE}

post-install:
	cd ${PREFIX}/libdata/pkgconfig/ && ${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' libxul-embedding.pc \
		mozilla-gtkmozembed-embedding.pc mozilla-js.pc mozilla-plugin.pc libxul.pc mozilla-nss.pc \
		mozilla-gtkmozembed.pc

.include <bsd.port.post.mk>
