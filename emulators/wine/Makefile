# $MidnightBSD: mports/emulators/wine/Makefile,v 1.14 2011/02/02 21:40:20 laffer1 Exp $

PORTNAME=	wine
DISTVERSION=	1.3.12
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	SF/${PORTNAME}/Source \
		http://ibiblio.org/pub/linux/system/emulators/wine/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft Windows compatibility layer for Unix-like systems
LICENSE=        lgpl3

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex
LIB_DEPENDS=	fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig \
		freetype.9:${PORTSDIR}/print/freetype2 \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		lcms.1:${PORTSDIR}/graphics/lcms \
		png.6:${PORTSDIR}/graphics/png \
		xml2:${PORTSDIR}/textproc/libxml2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--datadir=${DATADIR} --verbose --disable-tests \
		--with-glu --with-opengl --with-xrandr \
		--without-capi --without-gphoto --without-gsm \
		--without-v4l --without-mpg123 --without-sane \
		--without-xcomposite --without-xinerama
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		FLEX="${LOCALBASE}/bin/flex"
USE_LDCONFIG=	${PREFIX}/lib ${PREFIX}/lib/wine
MAKE_JOBS_SAFE=	yes
MAN1=		msiexec.1 notepad.1 regedit.1 regsvr32.1 widl.1 wine.1 \
		wineboot.1 winebuild.1 winecfg.1 wineconsole.1 winedbg.1 \
		winedump.1 winefile.1 winegcc.1 winemaker.1 winemine.1 \
		winepath.1 wineserver.1 wmc.1 wrc.1
MLINKS=		winegcc.1 winecpp.1 \
		winegcc.1 wineg++.1
ONLY_FOR_ARCHS=	i386
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GL=		glu
USE_XORG=	xcursor xpm xrandr xrender

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

OPTIONS=	CUPS	"Use CUPS (Common UNIX Printing System)"	Off \
		GNUTLS	"Use GnuTLS"					Off \
		HAL	"Use HAL (Hardware Abstraction Layer)"		Off \
		LDAP	"Use LDAP"					Off \
		LIBXSLT	"Use libxslt (only used by msxml3.dll)"		Off \
		OPENAL	"Use OpenAL (3D audio library)"			Off \
		WINEMAKER "Fully support winemaker (requires Perl)"	Off

.include <bsd.port.pre.mk>

.ifdef WITHOUT_CUPS
CONFIGURE_ARGS+=	--without-cups
.else
CONFIGURE_ARGS+=	--with-cups
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-client
.endif

.ifdef WITH_GNUTLS
CONFIGURE_ARGS+=	--with-gnutls
LIB_DEPENDS+=	gnutls.40:${PORTSDIR}/security/gnutls
.else
CONFIGURE_ARGS+=	--without-gnutls
.endif

.ifdef WITH_HAL
CONFIGURE_ARGS+=	--with-hal
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
.else
CONFIGURE_ARGS+=	--without-hal
.endif

.ifdef WITH_LDAP
CONFIGURE_ARGS+=	--with-ldap
USE_OPENLDAP=	yes
.else
CONFIGURE_ARGS+=	--without-ldap
.endif

.ifdef WITH_LIBXSLT
CONFIGURE_ARGS+=	--with-xslt
LIB_DEPENDS+=	xslt.2:${PORTSDIR}/textproc/libxslt
.else
CONFIGURE_ARGS+=	--without-xslt
.endif

.ifdef WITH_OPENAL
CONFIGURE_ARGS+=	--with-openal
USE_OPENAL=		yes
.else
CONFIGURE_ARGS+=	--without-openal
.endif

.ifdef WITH_WINEMAKER
RUN_DEPENDS+=	p5-XML-LibXML>0:${PORTSDIR}/textproc/p5-XML-LibXML
.endif

.if ${OSVERSION} < 3000
IGNORE=		fails to properly work on versions of MidnightBSD before 0.3
.endif

pre-build:
	cd ${WRKSRC} && ${GMAKE} depend

post-install:
	@${RM} -f ${MAN1PREFIX}/man/de.UTF-8/man1/wine.1 \
	          ${MAN1PREFIX}/man/de.UTF-8/man1/winemaker.1 \
	          ${MAN1PREFIX}/man/de.UTF-8/man1/wineserver.1 \
	          ${MAN1PREFIX}/man/fr.UTF-8/man1/wine.1 \
	          ${MAN1PREFIX}/man/fr.UTF-8/man1/winemaker.1 \
	          ${MAN1PREFIX}/man/fr.UTF-8/man1/wineserver.1
	@-${RMDIR} -p ${MAN1PREFIX}/man/de.UTF-8/man1 \
	              ${MAN1PREFIX}/man/fr.UTF-8/man1
	${MV} -f ${PREFIX}/lib/libwine.so.1.0 ${PREFIX}/lib/libwine.so.1
	${LN} -sf libwine.so.1 ${PREFIX}/lib/libwine.so
.if !defined(NOPORTDOCS)
	-@${MKDIR} ${DOCSDIR}
.for i in README ANNOUNCE AUTHORS
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
	@${INSTALL_DATA} ${WRKSRC}/programs/winedbg/README ${DOCSDIR}/README.winedbg
	@${INSTALL_DATA} ${WRKSRC}/tools/winedump/README ${DOCSDIR}/README.winedump
.endif
	@${MKDIR} ${DESKTOPDIR}
	${MV} ${DATADIR}/applications/wine.desktop ${DESKTOPDIR}/
	@${RMDIR} ${DATADIR}/applications

.include <bsd.port.post.mk>
