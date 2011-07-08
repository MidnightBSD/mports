# $MidnightBSD: mports/www/browser35/Makefile,v 1.16 2011/06/12 05:22:43 laffer1 Exp $

PORTNAME=	browser35
DISTVERSION=	3.5.19
PORTREVISION=	0
CATEGORIES=	www ipv6
MASTER_SITES=	${MASTER_SITE_MOZILLA_EXTENDED}
MASTER_SITE_SUBDIR=	firefox/releases/${DISTVERSION}/source
DISTNAME=	firefox-${DISTVERSION}.source
WRKSRC=		${WRKDIR}/mozilla-1.9.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	gpl2

BUILD_DEPENDS=	nspr>=4.8:${PORTSDIR}/devel/nspr \
		zip:${PORTSDIR}/archivers/zip
LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		cairo.2:${PORTSDIR}/graphics/cairo \
		nspr4:${PORTSDIR}/devel/nspr \
		freetype.9:${PORTSDIR}/print/freetype2

CONFLICTS=	firefox-[0-9]* browser-2* browser-3.0.[0-9]*

USE_LDCONFIG=	${PREFIX}/lib/${MOZILLA}

USE_AUTOTOOLS=	autoconf213:env
USE_GNOME+=	gtk20 libidl desktopfileutils gnomelibs
USE_ICONV=	yes
USE_PERL5=	yes
USE_PERL5_BUILD=yes
USE_XORG=	printproto sm xt xi xext x11 xinerama ice xproto
MAKE_JOBS_SAFE=	yes

MOZILLA=	browser
MOZILLA_NAME=	Browser
MOZ_OPTIONS=	--program-transform-name='s/firefox/${MOZILLA}/'

WANT_GNOME=	yes
ALL_TARGET=	default
CONFIGURE_ENV=	LOCALBASE=${LOCALBASE} CPPFLAGS="-I${LOCALBASE}/include/cairo" \
		ac_cv_func__Unwind_Backtrace=no
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd7.0 \
			--target=${ARCH}-portbld-freebsd7.0 \
			--host=${ARCH}-portbld-freebsd7.0
GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
NO_MOZPKGINSTALL=yes
WANT_PERL=	yes
GECKO_PLIST_PRE_FILES=	lib/${MOZILLA}/chrome/icons/default/default.xpm
GECKO_PLIST_PRE_DIRS=   lib/${MOZILLA}/bin lib/${MOZILLA}/idl \
                        lib/${MOZILLA}/include lib/${MOZILLA}/lib \
                        lib/${MOZILLA}/sdk/idl lib/${MOZILLA}/sdk/include

FIREFOX_ICON=		${MOZILLA}.xpm
FIREFOX_ICON_SRC=	${PREFIX}/lib/${MOZILLA}/icons/default.xpm

SYSTEM_PREFS=	${PREFIX}/lib/${MOZILLA}/defaults/pref/firefox.js
MOZ_PIS_SCRIPTS=	moz_pis_S50cleanhome

OPTIONS=	DBUS "Enable D-BUS support" on \
		NEWTAB "Open external links in a new tab" on \
		SMB "Enable smb:// URI support using gnomevfs" off

.include <bsd.port.pre.mk>

GECKO_PTHREAD_LIBS!=${CC} -dumpspecs | ${GREP} -m 1 pthread | ${SED} -e 's|^.*%{\!pg: %{pthread:|| ; s|}.*$$||' || ${TRUE}

MOZ_TOOLKIT?=	cairo-gtk2
MOZ_OPTIONS+=	--enable-application=browser	\
		--enable-system-cairo		\
		--disable-official-branding	\
		--enable-canvas			\
		--enable-crypto			\
		--enable-default-toolkit=${MOZ_TOOLKIT} \
		--enable-xft			\
		--with-pthreads			\
		--enable-extensions=default	\
		--enable-image-decoders=default \
		--with-system-jpeg=${LOCALBASE} \
		--with-system-zlib=/usr         \
		--with-gssapi=${KRB5_HOME}      \
		--with-system-nspr              \
		--disable-auto-deps             \
		--enable-chrome-format=jar      \
		--disable-cpp-exceptions        \
		--disable-cpp-rtti              \
		--disable-glibtest              \
		--disable-gtktest               \
		--disable-freetypetest          \
		--enable-double-buffer          \
		--enable-mathml                 \
		--disable-installer             \
		--disable-md                    \
		--disable-pedantic              \
		--disable-bidi                  \
		--disable-xterm-updates		\
		--disable-xprint		\
		--disable-tests			\
		--disable-crashreporter		\
		--enable-xinerama		\
		--enable-libxul			\
		--disable-ogg			\
		--disable-wave			\
		--enable-svg			\
		--enable-svg-renderer=cairo	\
		--x-includes=${LOCALBASE}/include \
		--x-libraries=${LOCALBASE}/lib


.if ${HAVE_GNOME:Mlibgnomeui}!=""
USE_GNOME+=     libgnomeui
MOZ_OPTIONS+=   --enable-gnomeui
.else
MOZ_OPTIONS+=   --disable-gnomeui
.endif

.if defined(WITHOUT_DBUS)
MOZ_OPTIONS+=   --disable-dbus
.else
LIB_DEPENDS+=   dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
.endif

.if defined(WITH_SMB)
USE_GNOME+=             gnomevfs2
MOZ_OPTIONS+=   --enable-gnomevfs
PLIST_SUB+=	SMB=""
.else
MOZ_OPTIONS+=   --disable-gnomevfs
PLIST_SUB+=	SMB="@comment "
.endif

.if defined(WITH_DEBUG)
MOZ_OPTIONS+=   --enable-debug                          \
                --disable-strip
WITH_LOGGING=   yes
.else
MOZ_OPTIONS+=   --disable-debug                         \
                --enable-optimize=${WITH_OPTIMIZE}      \
                --enable-strip
.endif

.if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS:=        ${CFLAGS} -O2 -fno-strict-aliasing ${EXTRA_CFLAGS}
WITH_OPTIMIZE?= -O2
.else
CFLAGS:=        ${CFLAGS} ${EXTRA_CFLAGS}
WITH_OPTIMIZE?=
.endif

.if defined(WITH_JAVA) && defined(_WITH_JAVA)
USE_JAVA=       yes
JAVA_VERSION+=  1.4+
JAVA_OS+=       native
CONFIGURE_ENV+= JAVA_HOME="${JAVA_HOME}"
MOZ_OPTIONS+=   --enable-javaxpcom
.endif

.if defined(WITH_LOGGING)
MOZ_OPTIONS+=   --enable-logging
.else
MOZ_OPTIONS+=   --disable-logging
.endif

.if ${ARCH}=="sparc64"
# Work around miscompilation/mislinkage of the sCanonicalVTable hacks.
MOZ_OPTIONS+=	--disable-v1-string-abi
.endif

MOZ_SED_ARGS+=	-e 's|@CPPFLAGS@|${CPPFLAGS}|g'		\
		-e 's|@CFLAGS@|${CFLAGS}|g'		\
		-e 's|@LDFLAGS@|${LDFLAGS}|g'		\
		-e 's|@LIBS@|${LIBS}|g'			\
		-e 's|@LOCALBASE@|${LOCALBASE}|g'	\
		-e 's|@FAKEDIR@|${FAKEDIR}|g'		\
		-e 's|@PERL@|${PERL5}|g'		\
		-e 's|@KRB5_HOME@|${KRB5_HOME}|g'	\
		-e 's|@MOZDIR@|${PREFIX}/lib/${MOZILLA}|g'	\
		-e 's|@PREFIX@|${PREFIX}|g' 	        \
		-e 's|%%PREFIX%%|${PREFIX}|g'		\
		-e 's|%%CFLAGS%%|${CFLAGS}|g'		\
		-e 's|%%LDFLAGS%%|${LDFLAGS}|g'		\
		-e 's|%%LIBS%%|${LIBS}|g'		\
		-e 's|%%LOCALBASE%%|${LOCALBASE}|g'	\
		-e 's|%%FAKEDIR%%|${FAKEDIR}|g'		\
		-e 's|%%PERL%%|${PERL5}|g'		\
		-e 's|%%KRB5_HOME%%|${KRB5_HOME}|g'	\
		-e 's|%%MOZILLA%%|${MOZILLA}|g'		\
		-e 's|%%MOZILLA_BIN%%|${MOZILLA_BIN}|g'	\
		-e 's|%%MOZDIR%%|${PREFIX}/lib/${MOZILLA}|g'
MOZCONFIG_SED?=	${SED} ${MOZ_SED_ARGS}

CONFIGURE_ARGS+=	${MOZ_OPTIONS}

post-extract:
	@${SED} -e 's|@FIREFOX_ICON@|${FIREFOX_ICON}|' -e 's|@MOZILLA@|${MOZILLA}|' \
		-e 's|@MOZILLA_NAME@|${MOZILLA_NAME}|' \
		<${FILESDIR}/firefox.desktop.in >${WRKDIR}/${MOZILLA}.desktop

pre-configure:
	(cd ${WRKSRC} && ${AUTOCONF})

post-patch:
	@${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS:C/-pthread/${GECKO_PTHREAD_LIBS}/}|' \
		${WRKSRC}/storage/build/Makefile.in \
		${WRKSRC}/db/sqlite3/src/Makefile.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/security/manager/ssl/src/Makefile.in \
		${WRKSRC}/js/src/config/mkdepend/Makefile.in \
                ${WRKSRC}/js/src/config/config.mk
.for ii in modules/libpref/src/init
	@${REINPLACE_CMD} -e '/accessibility.typeaheadfind.enablesound/s/true/false/ ; \
		/dom.disable_window_open_feature.toolbar/s/false/true/' \
		${WRKSRC}/${ii}/all.js
.endfor
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
.endif
	@${REINPLACE_CMD} -e  's/%{idldir}/%idldir%/g ; \
		s|"%FULL_NSPR_CFLAGS%"|`nspr-config --cflags`|g ; \
		s|"%FULL_NSPR_LIBS%"|`nspr-config --libs`|g' \
			${WRKSRC}/build/unix/mozilla-config.in
	@${REINPLACE_CMD} -e 's|<iconv.h>|\"${LOCALBASE}/include/iconv.h\"|g' \
		${WRKSRC}/configure \
		${WRKSRC}/intl/uconv/native/nsNativeUConvService.cpp \
		${WRKSRC}/xpcom/io/nsNativeCharsetUtils.cpp
	@${REINPLACE_CMD} -e 's|%%MOZILLA%%|${MOZILLA}|g' \
		${WRKSRC}/config/autoconf.mk.in
	@${REINPLACE_CMD} -e 's|-pthread|${PTHREAD_LIBS}|g ; \
		s|echo aout|echo elf|g ; s|/usr/X11R6|${LOCALBASE}|g' \
		${WRKSRC}/security/coreconf/FreeBSD.mk \
		${WRKSRC}/security/coreconf/MidnightBSD.mk \
		${WRKSRC}/js/src/Makefile.in
	@if [ -d ${WRKSRC}/directory/c-sdk ]; then \
		${REINPLACE_CMD} -e 's|echo aout|echo elf|g' \
			${WRKSRC}/directory/c-sdk/config/FreeBSD.mk \
			${WRKSRC}/directory/c-sdk/configure ; \
	fi
	@${REINPLACE_CMD} -e 's|-lc_r|${PTHREAD_LIBS}|g ; \
		s|-lpthread|${PTHREAD_LIBS}|g ; \
		s|echo aout|echo elf|g ; \
		s|/usr/X11R6|${LOCALBASE}|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' \
		${WRKSRC}/build/unix/run-mozilla.sh
	@${REINPLACE_CMD} -E -e 's|libesd\.so\.[0-9]+|libesd.so|g' \
		${WRKSRC}/widget/src/gtk2/nsSound.cpp
	@${REINPLACE_CMD} -E -e 's|libcups\.so\.[0-9]+|libcups.so|g' \
		${WRKSRC}/*/*/*/nsDeviceContextSpecG.cpp
	@${REINPLACE_CMD} -e 's|/usr/local/netscape|${LOCALBASE}|g ; \
		s|/usr/local/lib/netscape|${LOCALBASE}/lib|g' \
		${WRKSRC}/xpcom/*/SpecialSystemDirectory.cpp
	@if [ -n "`${PKG_INFO} -xI '^bind[0-9]*-base-[0-9]'`" ]; then \
		${ECHO_CMD} "${PKGNAME}: bind installed with PORT_REPLACES_BASE_BIND causes build problems."; \
		${FALSE}; \
	fi
	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD`${UNAME} -r`.mk
	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD${OSREL}.mk

post-configure:
	@${ECHO_CMD} "#define JNIIMPORT" >> ${WRKSRC}/mozilla-config.h

pre-install:
.if !defined(WITHOUT_NEWTAB)
	${MKDIR} ${PREFIX}/lib/${MOZILLA}/defaults/pref
	${ECHO_CMD} >> ${SYSTEM_PREFS}
	${ECHO_CMD} "// Open external links in new tab" >> ${SYSTEM_PREFS}
	${ECHO_CMD} "pref(\"browser.link.open_external\", 3);" \
		>> ${SYSTEM_PREFS}
.endif # !defined(WITHOUT_NEWTAB)

#do-install:
#	if [ ! -L ${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ]; then \
#		for jpi in ${JPI_LIST}; do \
#			if [ -f $${jpi} ]; then \
#				${LN} -sf $${jpi} \
#					${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ; \
#				break; \
#			fi; \
#		done; \
#	fi

post-install:
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKDIR}/${MOZILLA}.desktop ${PREFIX}/share/applications/
	${MKDIR} ${PREFIX}/lib/${MOZILLA}/chrome/icons/default
	${LN} -sf ${FIREFOX_ICON_SRC} ${PREFIX}/lib/${MOZILLA}/chrome/icons/default/default.xpm
	${LN} -sf ${FIREFOX_ICON_SRC} ${PREFIX}/share/pixmaps/${FIREFOX_ICON}
	${LN} -s ${PREFIX}/lib/browser/browser ${PREFIX}/bin/browser
	${MV} ${PREFIX}/lib/browser/firefox-bin ${PREFIX}/lib/browser/browser-bin
	${MV} ${PREFIX}/lib/browser/firefox ${PREFIX}/lib/browser/browser
#	${MV} ${PREFIX}/lib/pkgconfig/firefox-nspr.pc ${PREFIX}/libdata/pkgconfig/${MOZILLA}-nspr.pc
#	${MV} ${PREFIX}/lib/pkgconfig/firefox-xpcom.pc ${PREFIX}/libdata/pkgconfig/${MOZILLA}-xpcom.pc
#	${MV} ${PREFIX}/lib/pkgconfig/firefox-js.pc ${PREFIX}/libdata/pkgconfig/${MOZILLA}-js.pc
#	${REINPLACE_CMD} -e 's/firefox/${MOZILLA}/' ${PREFIX}/lib/pkgconfig/firefox-gtkmozembed.pc 
#	${MV} ${PREFIX}/lib/pkgconfig/firefox-gtkmozembed.pc ${PREFIX}/libdata/pkgconfig/${MOZILLA}-gtkmozembed.pc
#	${MV} ${PREFIX}/lib/pkgconfig/firefox-nss.pc ${PREFIX}/libdata/pkgconfig/${MOZILLA}-nss.pc
#	${MV} ${PREFIX}/lib/pkgconfig/firefox-plugin.pc ${PREFIX}/libdata/pkgconfig/${MOZILLA}-plugin.pc
	
.include <bsd.port.post.mk>
