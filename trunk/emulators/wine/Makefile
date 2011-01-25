# $MidnightBSD: mports/emulators/wine/Makefile,v 1.12 2010/03/25 02:01:01 laffer1 Exp $

PORTNAME=	wine
PORTVERSION=    1.1.36
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	SFE \
		http://ibiblio.org/pub/linux/system/emulators/wine/
MASTER_SITE_SUBDIR=	${PORTNAME}

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
                --without-capi --without-gphoto -without-gsm \
		--without-mpg123 --without-sane --without-xcursor \
		--without-openal
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		FLEX="${LOCALBASE}/bin/flex"
USE_LDCONFIG=	${PREFIX}/lib ${PREFIX}/lib/wine
MAKE_JOBS_SAFE=	yes
MAN1=		widl.1 wine.1 winebuild.1 winedbg.1 winedump.1 winegcc.1 \
		winemaker.1 wineprefixcreate.1 wineserver.1 wmc.1 wrc.1
MLINKS=		winegcc.1 wineg++.1
ONLY_FOR_ARCHS=	i386
USE_BISON=	build
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GL=		glut
USE_XORG=	xpm xrender

SUB_FILES=	pkg-message

OPTIONS=	CUPS	"Use CUPS (Common UNIX Printing System)" On \
		HAL	"Use HAL (Hardware Abstraction Layer)"	 Off \
		LDAP	"Use LDAP"				 Off \
		LIBXSLT	"Use libxslt (only used by msxml3.dll)"	 Off

.include <bsd.port.pre.mk>

.ifdef WITHOUT_CUPS
CONFIGURE_ARGS+=	--without-cups
.else
CONFIGURE_ARGS+=	--with-cups
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-base
.endif

.ifdef WITH_HAL
CONFIGURE_ARGS+=	--with-hal
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
.else
CONFIGURE_ARGS+=	--without-hal
.endif

.ifdef WITH_LDAP
CONFIGURE_ARGS+=        --with-ldap
USE_OPENLDAP=   yes
.else
CONFIGURE_ARGS+=        --without-ldap
.endif

.ifdef WITH_LIBXSLT
CONFIGURE_ARGS+=        --with-xslt
LIB_DEPENDS+=   xslt.2:${PORTSDIR}/textproc/libxslt
.else
CONFIGURE_ARGS+=        --without-xslt
.endif

post-patch:
	${REINPLACE_CMD} 's/-lpthread/-lthr/g' ${WRKSRC}/configure
	${REINPLACE_CMD} '/ac_hal_libs=/s/"$$/ -lthr"/' ${WRKSRC}/configure

pre-build:
	cd ${WRKSRC} && make depend

post-install:
	@${RM} -f ${MAN1PREFIX}/man/de.UTF-8/man1/wine.1 \
	          ${MAN1PREFIX}/man/fr.UTF-8/man1/wine.1 \
	          ${MAN1PREFIX}/man/fr.UTF-8/man1/wineserver.1
	@-${RMDIR} -p ${MAN1PREFIX}/man/de.UTF-8/man1 \
	              ${MAN1PREFIX}/man/fr.UTF-8/man1
	${MV} -f ${PREFIX}/lib/libwine.so.1.0 ${PREFIX}/lib/libwine.so.1
	${LN} -sf libwine.so.1 ${PREFIX}/lib/libwine.so
.if !defined(NOPORTDOCS)
	-@${MKDIR} ${DOCSDIR}
.for i in README ANNOUNCE AUTHORS LICENSE
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
	@${INSTALL_DATA} ${WRKSRC}/programs/winedbg/README ${DOCSDIR}/README.winedbg
	@${INSTALL_DATA} ${WRKSRC}/tools/winedump/README ${DOCSDIR}/README.winedump
.endif
	@${MKDIR} ${DESKTOPDIR}
	@${MV} ${DATADIR}/applications/wine.desktop ${DESKTOPDIR}/
    
.include <bsd.port.post.mk>
