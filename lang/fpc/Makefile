PORTNAME=	fpc
PORTVERSION=	3.2.3
CATEGORIES=	lang
MASTER_SITES=	http://leaf.dragonflybsd.org/~marino/dports-src/:DragonFlybootstrap \
		FREEBSD_LOCAL/acm/freepascal/:bootstrap \
		FREEBSD_LOCAL/acm/freepascal/:man
DIST_SUBDIR=	freepascal

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal compiler with Turbo and Delphi compatibility
WWW=		https://www.freepascal.org/

LICENSE=	gpl2

CONFLICTS=	fpc-devel

RUN_DEPENDS=	${LOCALBASE}/bin/as:devel/binutils

ONLY_FOR_ARCHS=	amd64 i386

USES+=		gmake iconv
USE_BINUTILS=	yes
BOOTVER=	3.2.2
MANVER=		3.2.2

USE_GITLAB=	yes
GL_SITE=	https://gitlab.com/freepascal.org
GL_ACCOUNT=	fpc
GL_PROJECT=	source
GL_TAGNAME=	57e84ef714df2404341229bd795dd69a8a6a38bb

FPCSRCDIR=	source-${GL_TAGNAME}

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
PPNAME=		ppc386
FPC_ARCH=	i386
#OPT=		"-dFPC_USE_LIBC"
PLIST_SUB+=	FPC_I386="" \
		FPC_AMD64="@comment "
.elif ${ARCH} == "amd64"
PPNAME=		ppcx64
FPC_ARCH=	x86_64
#OPT=		"-dFPC_USE_LIBC"
PLIST_SUB+=	FPC_I386="@comment " \
		FPC_AMD64=""
.endif

PLIST_SUB+=	FREEBSD=""

SUB_FILES=	pkg-message

BUILDNAME=	${FPC_ARCH}-freebsd
PLIST_SUB+=	PORTVERSION=${PORTVERSION} \
		BUILDNAME=${BUILDNAME}
DISTFILES+=	${BOOTDIR}.tar.gz:bootstrap \
		fpc-${MANVER}.man.tar.gz:man
NEWFPCMAKE=	${WRKDIR}/${FPCSRCDIR}/utils/fpcm/bin/${BUILDNAME}/fpcmake
MAKE_ARGS+=	FPCMAKE=${NEWFPCMAKE} \
		FPCTARGET=${BUILDNAME} \
		ARCH=${FPC_ARCH} \
		OPT="${OPT}" \
		BSDHIER=1 \
		INSTALL="${INSTALL_DATA} -p" \
		INSTALLEXE="${INSTALL_PROGRAM}" \
		INSTALLSCR="${INSTALL_SCRIPT}" \
		INSTALL_PREFIX=${STAGEDIR}${PREFIX} \
		FPC_LDPATH=${FPC_LDPATH} \
		BSDs=midnightbsd freebsd netbsd openbsd darwin dragonfly
NEWPPC=		PP=${WRKSRC}/compiler/${PPNAME}
NEWFPC=		FPC=${WRKSRC}/compiler/${PPNAME}
BOOTDIR=	${PPNAME}-${BOOTVER}-freebsd
BOOTPPC=	PP=${WRKDIR}/${BOOTDIR}

do-extract:
# unpack binary distribution
	@${MKDIR} ${WRKDIR}
	@${TAR} -xzf ${_DISTDIR}/${BOOTDIR}.tar.gz \
		--directory ${WRKDIR} && ${CHMOD} +x ${WRKDIR}/${BOOTDIR}
# unpack man files
	@${TAR} -xzf ${_DISTDIR}/fpc-${MANVER}.man.tar.gz --directory ${WRKDIR}
# unpack source distribution
	@(cd ${WRKDIR} && ${GZIP_CMD} -dc \
		${_DISTDIR}/${PORTNAME}-source-${GL_TAGNAME}_GL0${EXTRACT_SUFX} | \
		${TAR} -xf -)

post-patch:
	@${REINPLACE_CMD} -i "" -e 's|900044|${OSVERSION}|g' \
				-e 's|1201000|${OSVERSION}|g' \
				-e 's|1200000|${OSVERSION}|g' \
				-e 's|1400097|${OSVERSION}|g' \
		${WRKSRC}/rtl/freebsd/${FPC_ARCH}/*.as \
		${WRKSRC}/rtl/freebsd/${FPC_ARCH}/*.inc
.if empty(ICONV_LIB)
	@${REINPLACE_CMD} -e "s|s<>'c'|(s<>'c') and (s<>'iconv')|" \
			-e "s|%%FPC_LDPATH%%|${FPC_LDPATH}|g" \
				${WRKDIR}/${FPCSRCDIR}/compiler/systems/t_bsd.pas
	@${REINPLACE_CMD} -e 's|defined(bsd) and not ||' \
		${WRKDIR}/${FPCSRCDIR}/rtl/unix/cwstring.pp
.endif
	@${REINPLACE_CMD} -e '/samplecfg/ {s/INSTALLEXE/INSTALLSCR/;}' \
		${WRKDIR}/${FPCSRCDIR}/compiler/Makefile
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' \
		${WRKDIR}/${FPCSRCDIR}/packages/fpmkunit/src/fpmkunit.pp

# enable units
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/a52/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/dbus/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/dts/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|freebsd,||g' \
		${WRKSRC}/packages/fpgtk/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|iphonesim|midnightbsd,freebsd,iphonesim|g' \
		${WRKSRC}/packages/gnome1/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|iphonesim|midnightbsd,freebsd,iphonesim|g' \
		${WRKSRC}/packages/gtk1/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|iphonesim|midnightbsd,freebsd,iphonesim|g' \
		${WRKSRC}/packages/imlib/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/ldap/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/libsee/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/lua/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/mad/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/modplug/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|Linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/newt/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/oggvorbis/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/openal/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/opencl/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/proj4/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/ptc/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|os2|midnightbsd,freebsd,os2|g' \
		${WRKSRC}/packages/rexx/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|linux|midnightbsd,freebsd,linux|g' \
		${WRKSRC}/packages/zorba/fpmake.pp
	@${REINPLACE_CMD} -i "" -e 's|FreeBSD|FreeBSD,MidnightBSD|g' \
		${WRKSRC}/utils/fpcm/fpcmake.ini
	@${REINPLACE_CMD} -i "" -e 's|FreeBSD|MidnightBSD,FreeBSD|g' \
		${WRKSRC}/rtl/fpmake.pp

do-build:
# build fpc compiler
	@${ECHO_MSG} "##### STARTING COMPILER #####"
	(cd ${WRKDIR}/${FPCSRCDIR}/compiler && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} cycle ${MAKE_ARGS} ${BOOTPPC})
	@${ECHO_MSG} "##### COMPLETE COMPILER #####"

# build units
	@${ECHO_MSG} "##### STARTING UNITS #####"
	(cd ${WRKDIR}/${FPCSRCDIR} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} build ${MAKE_ARGS} ${BOOTPPC})
	@${ECHO_MSG} "##### COMPLETE UNITS #####"

do-install:
	# Installing fpc compiler
	(cd ${WRKDIR}/${FPCSRCDIR} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} install ${MAKE_ARGS} ${BOOTPPC})

	# Installing manpages
	${INSTALL_MAN} ${WRKDIR}/man/man1/* ${STAGEDIR}${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKDIR}/man/man5/* ${STAGEDIR}${PREFIX}/share/man/man5
	# symlinking compiler
	(cd ${STAGEDIR}${PREFIX}/bin && ${LN} -sf ../lib/fpc/${PORTVERSION}/${PPNAME})
	# creating sample configuration file
	${SH} "${STAGEDIR}${PREFIX}/lib/fpc/${PORTVERSION}/samplecfg" \
		"${STAGEDIR}${PREFIX}/lib/fpc/${PORTVERSION}" \
		"${STAGEDIR}${PREFIX}/etc"
	@${REINPLACE_CMD} -i "" -e 's|${STAGEDIR}||' \
		-e 's|^#-Fl/lib;/usr/lib|-Fl${LOCALBASE}/lib;${LOCALBASE}/lib/qt5;${LOCALBASE}/lib/qt6|g' \
			${STAGEDIR}${PREFIX}/etc/fpc.cfg.sample \
			${STAGEDIR}${PREFIX}/etc/fppkg.cfg.sample \
			${STAGEDIR}${PREFIX}/etc/fppkg/default \
			${STAGEDIR}${PREFIX}/lib/fpc/${PORTVERSION}/ide/text/fp.cfg

.include <bsd.port.post.mk>
