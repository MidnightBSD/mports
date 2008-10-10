# New ports collection makefile for:	phoenix
# Date created:			2002/10/21
# Whom:				Alan Eldridge <alane@FreeBSD.org>
#
# $MidnightBSD: mports/www/browser/Makefile,v 1.10 2008/10/08 21:12:24 laffer1 Exp $
# $FreeBSD: ports/www/firefox/Makefile,v 1.183 2007/10/10 00:15:32 marcus Exp $
#   $MCom: ports/www/firefox/Makefile,v 1.39 2007/05/31 12:16:54 ahze Exp $
#

PORTNAME=	browser
DISTVERSION=	2.0.0.17
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	www ipv6
MASTER_SITES=	${MASTER_SITE_MOZILLA_EXTENDED}
MASTER_SITE_SUBDIR=	firefox/releases/${DISTVERSION}/source
DISTNAME=	firefox-${DISTVERSION}-source
WRKSRC=		${WRKDIR}/mozilla

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	gpl2

BUILD_DEPENDS=	nss>=3.11.2:${PORTSDIR}/security/nss \
		zip:${PORTSDIR}/archivers/zip
LIB_DEPENDS+=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		cairo.2:${PORTSDIR}/graphics/cairo \
		nspr4:${PORTSDIR}/devel/nspr \
		nss3:${PORTSDIR}/security/nss \
		freetype.9:${PORTSDIR}/print/freetype2

CONFLICTS=	firefox-[0-9]*

USE_GNOME+=	gtk20 libidl desktopfileutils
USE_ICONV=	yes
USE_PERL5=	yes
USE_PERL5_BUILD=yes
USE_XORG=	printproto sm xt xi xext x11 xinerama \
		ice xproto

MOZILLA=	browser
MOZILLA_NAME=	Browser
MOZ_OPTIONS=	--program-transform-name='s/firefox/${MOZILLA}/'

WANT_GNOME=	yes
ALL_TARGET=	default
CONFIGURE_ENV=	LOCALBASE=${LOCALBASE}
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0 \
			--target=${ARCH}-portbld-freebsd6.0 \
			--host=${ARCH}-portbld-freebsd6.0
EXTRA_CFLAGS=	-O2
HAS_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
WANT_PERL=	yes
GECKO_PLIST_PRE_FILES=	lib/${MOZILLA}/chrome/icons/default/default.xpm
GECKO_PLIST_PRE_DIRS=	lib/${MOZILLA}/chrome/icons/default lib/${MOZILLA}/chrome/icons

FIREFOX_ICON=		${MOZILLA}.xpm
FIREFOX_ICON_SRC=	${PREFIX}/lib/${MOZILLA}/icons/default.xpm

SYSTEM_PREFS=	${FAKE_DESTDIR}${PREFIX}/lib/${MOZILLA}/defaults/pref/firefox.js
MOZ_PIS_SCRIPTS=	moz_pis_S50cleanhome

OPTIONS=	NEWTAB "Open external links in a new tab" on \
		SMB "Enable smb:// URI support using gnomevfs" off

.include <bsd.port.pre.mk>

GECKO_PTHREAD_LIBS!=${CC} -dumpspecs | ${GREP} -m 1 pthread | ${SED} -e 's|^.*%{\!pg: %{pthread:|| ; s|}.*$$||' || ${TRUE}

MOZ_TOOLKIT?=	gtk2
MOZ_OPTIONS+=	--enable-application=browser	\
		--enable-system-cairo		\
		--disable-official-branding	\
		--enable-canvas			\
		--with-system-nss		\
		--enable-crypto			\
		--disable-tests			\
		--enable-default-toolkit=${MOZ_TOOLKIT} \
		--enable-xft			\
		--with-pthreads			\
		--enable-extensions=default	\
		--enable-image-decoders=default \
		--with-system-jpeg=${LOCALBASE} \
		--with-system-zlib=/usr         \
		--with-system-png=${LOCALBASE}  \
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
		--enable-xinerama		\
		--enable-svg			\
		--enable-svg-renderer=cairo	\
		--x-includes=${LOCALBASE}/include \
		--x-libraries=${LOCALBASE}/lib

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
#	${CP} ${FILESDIR}/config.sub ${WRKSRC}/build/autoconf
#	${CP} ${FILESDIR}/config.guess ${WRKSRC}/build/autoconf

post-patch:
	@${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS:C/-pthread/${GECKO_PTHREAD_LIBS}/}|' \
		${WRKSRC}/storage/build/Makefile.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/security/manager/ssl/src/Makefile.in
.for ii in modules/libpref/src/init extensions/sroaming/resources/content/prefs \
	embedding/minimo
	@${REINPLACE_CMD} -e '/accessibility.typeaheadfind.enablesound/s/true/false/ ; \
		/dom.disable_window_open_feature.toolbar/s/false/true/' \
		${WRKSRC}/${ii}/all.js
.endfor
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
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/${MOZILLA}/defaults/pref
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
	${MV} ${PREFIX}/bin/firefox ${PREFIX}/bin/browser
	${MV} ${PREFIX}/lib/browser/firefox-bin ${PREFIX}/lib/browser/browser-bin
	${MV} ${PREFIX}/bin/firefox-config ${PREFIX}/bin/browser-config

.include <bsd.port.post.mk>
