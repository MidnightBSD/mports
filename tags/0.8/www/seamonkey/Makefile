# $MidnightBSD$

PORTNAME=	seamonkey
DISTVERSION=	2.33.1
PORTREVISION=	1
CATEGORIES?=	www mail news editors irc ipv6
MASTER_SITES=	MOZILLA/${PORTNAME}/releases/${DISTVERSION}/source \
		MOZILLA/${PORTNAME}/candidates/${DISTVERSION}-candidates/build1/source
DISTFILES=	${PORTNAME}-${DISTVERSION}.source${EXTRACT_SUFX}
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}.source${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser

LICENSE=	mpl

BUILD_DEPENDS=	nspr>=4.10.6:${PORTSDIR}/devel/nspr \
		nss>=3.17.4:${PORTSDIR}/security/nss \
		libevent2>=2.0.21_2:${PORTSDIR}/devel/libevent2 \
		soundtouch>=1.8.0:${PORTSDIR}/audio/soundtouch \
		harfbuzz>=0.9.34:${PORTSDIR}/print/harfbuzz \
		graphite2>=1.2.4:${PORTSDIR}/graphics/graphite2 \
		libvorbis>=1.3.5:${PORTSDIR}/audio/libvorbis \
		opus>=1.1:${PORTSDIR}/audio/opus \
		libvpx>=1.3.0:${PORTSDIR}/multimedia/libvpx \
		sqlite3>=3.8.7.4:${PORTSDIR}/databases/sqlite3 \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		v4l_compat>0:${PORTSDIR}/multimedia/v4l_compat \
		autoconf-2.13:${PORTSDIR}/devel/autoconf213 \
		zip:${PORTSDIR}/archivers/zip \
		unzip:${PORTSDIR}/archivers/unzip

LIB_DEPENDS=	libv4l2.so:${PORTSDIR}/multimedia/libv4l

EM_VERSION=	1.8.2
L_VERSION=	3.8

SSP_UNSAFE=	yes
USE_GECKO=	gecko
USE_QT5=	# empty
QT_NONSTANDARD=	yes
USE_GL=		gl
USES=		dos2unix tar:bzip2
DOS2UNIX_FILES=	mozilla/media/webrtc/trunk/webrtc/system_wrappers/source/spreadsortlib/spreadsort.hpp
MOZ_PIS_SCRIPTS=	moz_pis_S50cleanhome

MOZ_EXTENSIONS=	default
MOZ_OPTIONS+=	--program-transform-name='s/seamonkey/${MOZILLA}/' \
		--enable-application=suite

MAKE_ENV+=    __FreeBSD_=9 __FREEBSD_version=90100

USE_MOZILLA=	# empty
MOZ_PKGCONFIG_FILES=

OPTIONS_DEFINE=	CHATZILLA COMPOSER LIGHTNING MAILNEWS
OPTIONS_DEFAULT=CANBERRA CHATZILLA COMPOSER LIGHTNING MAILNEWS

CHATZILLA_DESC?=Chatzilla IRC module
COMPOSER_DESC?=	HTML Composer module
LDAP_DESC?=	LDAP support for Mailnews
MAILNEWS_DESC?=	Mail and News modules

.include "${.CURDIR}/../../www/browser/Makefile.options"
.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCHATZILLA}
MOZ_EXTENSIONS:=	${MOZ_EXTENSIONS},irc
.endif

.include <bsd.port.pre.mk>

WRKSRC=		${WRKDIR}/comm-release
MOZSRC:=	${WRKSRC}/mozilla

XPI_LIBDIR=	${PREFIX}/lib/xpi

.if ${PORT_OPTIONS:MALSA}
RUN_DEPENDS+=	alsa-lib>=1.0.27.2_1:${PORTSDIR}/audio/alsa-lib
.endif

.if ! ${PORT_OPTIONS:MBUNDLED_CAIRO}
BUILD_DEPENDS+=	cairo>=1.12.16_1,2:${PORTSDIR}/graphics/cairo
.endif

.if ${PORT_OPTIONS:MGSTREAMER}
RUN_DEPENDS+=	gstreamer1-libav>=1.2.4_1:${PORTSDIR}/multimedia/gstreamer1-libav
.endif

.if ! ${PORT_OPTIONS:MMAILNEWS}
MOZ_OPTIONS+=	--disable-ldap --disable-mailnews
.else
# mail and news desired, but not LDAP
MOZ_OPTIONS+=	--disable-ldap --enable-mailnews
.endif

.if ! ${PORT_OPTIONS:MCOMPOSER}
MOZ_OPTIONS+=	--disable-composer
.endif

.if ${PORT_OPTIONS:MLIGHTNING}
MOZ_OPTIONS+=	--enable-calendar
MOZ_MK_OPTIONS+=	MOZ_CO_PROJECT=calendar
LIGHTNING_DIR=	share/lightning
XPI_FILE=	${MOZ_OBJDIR}/dist/xpi-stage/lightning-${L_VERSION}.en-US.${OPSYS:tl}${OSREL}-${ARCH:S/amd64/x86_64/}.xpi
XPI_ORIG_ID=	{e2fda1a4-762b-4020-b5ad-a41df1933103}
XPI_ID=		lightning@seamonkey.mozilla.org
.else
MOZ_OPTIONS+=	--disable-calendar
.endif

pre-patch: dos2unix

post-patch:
	@${REINPLACE_CMD} -e '/MOZPNG/s/=[0-9]*/=10511/' \
		${MOZSRC}/configure.in ${WRKSRC}/configure.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/suite/app/nsSuiteApp.cpp
	@${REINPLACE_CMD} -e '/accessibility.typeaheadfind.enablesound/s/true/false/' \
		${WRKSRC}/mozilla/modules/libpref/init/all.js
	@${SED} -e 's|%%MOZILLA%%|${MOZILLA}|g' \
		< ${FILESDIR}/seamonkey.desktop.in > \
		${WRKDIR}/${MOZILLA}.desktop

pre-configure:
	(cd ${WRKSRC} && ${LOCALBASE}/bin/autoconf-2.13)
	(cd ${MOZSRC} && ${LOCALBASE}/bin/autoconf-2.13)
	(cd ${MOZSRC}/js/src/ && ${LOCALBASE}/bin/autoconf-2.13)

post-install:
	${INSTALL_DATA} ${WRKDIR}/${MOZILLA}.desktop ${STAGEDIR}${PREFIX}/share/applications/
	${LN} -sf ${PREFIX}/lib/${MOZILLA}/chrome/icons/default/default48.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/${MOZILLA}.png
.if ${PORT_OPTIONS:MLIGHTNING}
	@${MKDIR} ${STAGEDIR}${XPI_LIBDIR}/${XPI_ID} ${STAGEDIR}${XPI_LIBDIR}/symlinks/seamonkey
	@(cd ${STAGEDIR}${XPI_LIBDIR}/${XPI_ID}; ${TAR} -xf ${XPI_FILE})
	@${REINPLACE_CMD} -i "" "s/${XPI_ORIG_ID}/${XPI_ID}/" ${STAGEDIR}${XPI_LIBDIR}/${XPI_ID}/install.rdf
	@${CHMOD} -R a+rX,go-w ${STAGEDIR}${XPI_LIBDIR}/${XPI_ID}
	@${LN} -sf ${XPI_LIBDIR}/${XPI_ID} ${STAGEDIR}${XPI_LIBDIR}/symlinks/seamonkey 2>/dev/null || true
	@${ECHO_CMD} '@exec ${LN} -sf %D/lib/xpi/${XPI_ID} ${LOCALBASE}/lib/seamonkey/extensions 2>/dev/null || true' >> ${TMPPLIST}
	@${ECHO_CMD} '@unexec ${RM} -f ${LOCALBASE}/lib/seamonkey/extensions/${XPI_ID}' >> ${TMPPLIST}
.endif

.include <bsd.port.post.mk>
