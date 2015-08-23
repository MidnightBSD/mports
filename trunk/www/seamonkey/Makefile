# $MidnightBSD$

PORTNAME=	seamonkey
DISTVERSION=	1.1.19
PORTREVISION=	2
CATEGORIES?=	www ipv6
MASTER_SITES=	${MASTER_SITE_MOZILLA_EXTENDED}
MASTER_SITE_SUBDIR=	seamonkey/releases/${DISTVERSION}
DISTNAME=	${PORTNAME}-${DISTVERSION}.source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser

LICENSE=	mpl gpl2
LICENSE_COMB=	dual

USES=		gmake tar:bzip2 desktop-file-utils
WANT_GNOME=	yes
WANT_PERL=	yes
HAS_CONFIGURE=	yes
ALL_TARGET=	default
MOZ_PIS_SCRIPTS=	moz_pis_S50cleanhome
MAKE_ENV=	LD_LIBRARY_PATH=${WRKSRC}/dist/bin
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include/cairo" CXXFLAGS="-lc" \
		ac_cv_func__Unwind_Backtrace=no \
		LOCALBASE=${LOCALBASE}

FAKE_OPTS=	trueprefix

MOZ_EXTENSIONS=	default
MOZ_OPTIONS+=	--enable-svg \
		--enable-application=suite	\
		--enable-svg-renderer=cairo	\
		--enable-system-cairo		\
		--enable-canvas 		\
		--with-system-nss
MOZ_MK_OPTIONS+=	MOZ_CO_PROJECT=suite

OPTIONS=MAILNEWS "Enable Mail and News modules" on \
	COMPOSER "Enable the HTML Composer module" on \
	LDAP "Enable LDAP for Mailnews (broken)" off \
	CHATZILLA "Enable the Chatzilla IRC module" on \
	JAVASCRIPT_DEBUGGER "Enable DTD and JavaScript debuggers" off \
	SMB "Enable smb:// URI support using gnomevfs" off

.include <bsd.port.pre.mk>

.if (${ARCH} == "amd64")
CONFIGURE_ARGS+= x86_64-midnightbsd-freebsd
.else
CONFIGURE_ARGS+= ${ARCH}-midnightbsd-freebsd
.endif

GECKO_PTHREAD_LIBS!=${CC} -dumpspecs | ${GREP} -m 1 pthread | ${SED} -e 's|^.*%{\!pg: %{pthread:|| ; s|}.*$$||' || ${TRUE}

.if exists(${LOCALBASE}/include/cairo/cairo-glitz.h)
# Glitz support can only be enabled if cairo is built with glitz support
MOZ_OPTIONS+=	--enable-glitz
LIB_DEPENDS+=	libglitz.so:${PORTSDIR}/graphics/glitz
.endif

.if defined(WITHOUT_MAILNEWS)
MOZ_OPTIONS+=	--disable-ldap --disable-mailnews
.else
# mail and news desired, but not LDAP
.if defined(WITHOUT_LDAP)
MOZ_OPTIONS+=	--disable-ldap --enable-mailnews
.else
MOZ_OPTIONS+=	--enable-ldap --enable-mailnews
.endif
.endif
.if !defined(WITHOUT_CHATZILLA)
MOZ_EXTENSIONS:=	${MOZ_EXTENSIONS},irc
.endif
.if defined(WITH_JAVASCRIPT_DEBUGGER)
MOZ_OPTIONS+=		--enable-jsd \
			--enable-dtd-debug
.else
MOZ_OPTIONS+=		--disable-jsd \
			--disable-dtd-debug
.endif

.if defined(WITHOUT_COMPOSER)
MOZ_OPTIONS+=	--disable-composer
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/security/manager/ssl/src/Makefile.in
	${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS:C/-pthread/${GECKO_PTHREAD_LIBS}/}|' \
		${WRKSRC}/storage/build/Makefile.in
	@${REINPLACE_CMD} -e '/accessibility.typeaheadfind.enablesound/s/true/false/' \
		${WRKSRC}/modules/libpref/src/init/all.js
	@${REINPLACE_CMD} -e 's|<iconv.h>|\"${LOCALBASE}/include/iconv.h\"|g' \
		${WRKSRC}/configure \
		${WRKSRC}/intl/uconv/native/nsNativeUConvService.cpp \
		${WRKSRC}/xpcom/io/nsNativeCharsetUtils.cpp
	@${SED} -e 's|%%PREFIX%%|${PREFIX}|g' \
		< ${FILESDIR}/seamonkey.desktop.in > \
		${WRKDIR}/seamonkey.desktop
	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD`${UNAME} -r`.mk
	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD${OSREL}.mk

post-configure:
	${REINPLACE_CMD} -e 's|@MAJOR@||g' \
		${WRKSRC}/config/autoconf.mk

pre-install:
	if [ ! -L ${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ]; then \
		for jpi in ${JPI_LIST}; do \
			if [ -f $${jpi} ]; then \
				${ECHO_CMD} lib/browser_plugins/libjavaplugin_oji.so >> ${PLIST} ; \
				break; \
			fi; \
		done; \
	fi
	${ECHO_CMD} share/applications/seamonkey.desktop >> ${PLIST}
	${ECHO_CMD} "@unexec ${RMDIR} %D/share/applications 2>/dev/null || ${TRUE}" >> ${PLIST}

do-install:
	if [ ! -L ${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ]; then \
		for jpi in ${JPI_LIST}; do \
			if [ -f $${jpi} ]; then \
		    		${LN} -sf $${jpi} \
			    		${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ; \
				break; \
			fi; \
		done; \
	fi
	${MKDIR} ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKDIR}/seamonkey.desktop ${PREFIX}/share/applications

.include "Makefile.common"
.include <bsd.port.post.mk>
