# $MidnightBSD: mports/x11-wm/windowmaker/Makefile,v 1.14 2010/12/11 19:31:50 laffer1 Exp $

PORTNAME=	windowmaker
PORTVERSION=	0.92.0
PORTREVISION=	9
CATEGORIES=	x11-wm windowmaker
MASTER_SITES=	${MASTER_SITE_WINDOWMAKER} \
		http://dougbarton.us/Downloads/
MASTER_SITE_SUBDIR=	source/release
DISTNAME=	WindowMaker-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep-compliant NeXTstep window manager clone
LICENSE=	gpl2

LIB_DEPENDS=	ungif.5:${PORTSDIR}/graphics/libungif \
		png.6:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		Xft.2:${PORTSDIR}/x11-fonts/libXft
RUN_DEPENDS=	${LOCALBASE}/share/WindowMaker/Themes/LeetWM.themed/style:${PORTSDIR}/graphics/wmicons

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
USE_XORG=	xpm
USE_PERL5=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.1
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-pixmapdir=${PREFIX}/share/WindowMaker/Pixmaps \
		--with-nlsdir=${PREFIX}/share/locale \
		--with-libs-from="-L${LOCALBASE}/lib" \
		--with-incs-from="-I${LOCALBASE}/include" \
		--with-gnustepdir="${PREFIX}/GNUstep" \
		--disable-debug

MANLANG=	"" sk
MAN1=		geticonset.1x getstyle.1x seticons.1x setstyle.1x wdwrite.1x \
		wmaker.1x wmsetbg.1x wxcopy.1x wxpaste.1x

OPTIONS=	XINERAMA "Enable xinerama support" off \
		XKB_STATUS "XKB keyboard language status support" off \
		WM_SINGLE_CLICK "Add single-click option to WPrefs menu" on \
		WM_LINGUAS "Enable support for additional locales" off

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ENV+=	ac_cv_c_inline_asm=no
.endif

.if defined(WITH_XINERAMA) || defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=	--enable-xinerama
.endif

.if defined(WITH_XKB_STATUS) || defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=	--enable-modelock
.endif

.if !defined(WITHOUT_WM_SINGLE_CLICK) || defined(PACKAGE_BUILDING)
EXTRA_PATCHES+=		${WRKSRC}/contrib/single_click.diff
.endif

.if defined(WITH_WM_LINGUAS) || defined(PACKAGE_BUILDING)
LINGUAS!=	${CAT} ${FILESDIR}/LINGUAS
CONFIGURE_ENV+=	LINGUAS="${LINGUAS}"
PLIST_SUB=	WM_LINGUAS=""
.else
PLIST_SUB=	WM_LINGUAS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/WPrefs.app/Paths.c
	@${REINPLACE_CMD} -e "s|%%PERL%%|${PERL}|g" ${WRKSRC}/util/wm-oldmenu2new
	@${REINPLACE_CMD} -e "s|Trebuchet MS,Luxi Sans|sans|g" ${WRKSRC}/WindowMaker/Defaults/WMGLOBAL
	@${REINPLACE_CMD} -e "s|/usr/local/GNUstep|${PREFIX}/GNUstep/Local|g" \
		${WRKSRC}/WindowMaker/*menu*

post-install:
	@${MKDIR} ${PREFIX}/share/WindowMaker/Sounds
	@${MKDIR} -p ${PREFIX}/etc/dm/Sessions
	${CP} ${FILESDIR}/wmaker.desktop ${PREFIX}/etc/dm/Sessions

update-LINGUAS: extract
	cd ${WRKSRC}/po && \
		${ECHO_CMD} *.po | ${SED} 's|\.po||g' > ${FILESDIR}/LINGUAS

.include <bsd.port.post.mk>
