# $MidnightBSD: mports/x11-toolkits/gnustep-gui/Makefile,v 1.11 2010/05/05 23:47:43 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gnustep-gui/Makefile,v 1.83 2006/08/31 05:37:04 dinoex Exp $

PORTNAME=	gnustep-gui
PORTVERSION=	0.17.1
CATEGORIES=	x11-toolkits gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI library
LICENSE=	gpl3

LIB_DEPENDS+=	tiff.4:${PORTSDIR}/graphics/tiff
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg
LIB_DEPENDS+=	png.6:${PORTSDIR}/graphics/png
LIB_DEPENDS+=	gif.5:${PORTSDIR}/graphics/giflib
LIB_DEPENDS+=	audiofile:${PORTSDIR}/audio/libaudiofile

GNU_CONFIGURE=	yes
CPPFLAGS+=	"-I/usr/local/include"
LDFLAGS+=	"-L/usr/local/lib"
CONFIGURE_TARGET=
CONFIGURE_ARGS+=	--with-tiff-library=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-tiff-include=${LOCALBASE}/include
CONFIGURE_ARGS+=	--with-jpeg-library=${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-jpeg-include=${LOCALBASE}/include
CONFIGURE_ARGS+=	--with-x
CONFIGURE_ARGS+=	--with-x-include=${LOCALBASE}/include
CONFIGURE_ARGS+=	--with-x-include=${LCOALBASE}/lib
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_GNUSTEP=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_BASE=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
USE_XORG=	x11 xt

EXTRA_PATCHES+=		${FILESDIR}/GNUmakefile.patch
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
MAKE_FLAGS+=	OPTFLAG="${CFLAGS}"
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
BREAKS_IF_PEDANTIC=	yes
PLIST_SUB+=	BASEVERSION=${PORTVERSION:C/[.][0-9]*$//1}

.if defined(WITHOUT_GNUSTEP_FAKEMAIN)
.if !exists(/proc/curproc)
IGNORE=		requires procfs mounted to build or run, for details see procfs(5)
.endif
.endif

.if !defined(WITHOUT_CUPS)
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-base
PLIST_SUB+=	WITH_CUPS=""
.else
PLIST_SUB+=	WITH_CUPS="@comment "
.endif

ASPELL_PORT?=	textproc/aspell
.if !defined(WITHOUT_ASPELL)
LIB_DEPENDS+=	aspell:${PORTSDIR}/${ASPELL_PORT}
PLIST_SUB+=	WITH_ASPELL=""
.else
PLIST_SUB+=	WITH_ASPELL="@comment "
.endif

pre-configure:
.for file in config.guess config.sub install-sh
	@${CP} ${GNUSTEP_PREFIX}/System/Library/Makefiles/${file} ${WRKSRC}
.endfor
.if !defined(NOPORTDOCS)
	${REINPLACE_CMD} -e "s|doc=no|doc=yes|" ${WRKSRC}/GNUmakefile
.endif

.include <bsd.port.mk>
