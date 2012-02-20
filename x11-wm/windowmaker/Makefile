# $MidnightBSD: mports/x11-wm/windowmaker/Makefile,v 1.20 2012/02/20 15:21:32 laffer1 Exp $

PORTNAME=	windowmaker
PORTVERSION=	0.95.2
PORTREVISION=	1
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
		tiff.4:${PORTSDIR}/graphics/tiff
RUN_DEPENDS=	${LOCALBASE}/share/WindowMaker/Themes/LeetWM.themed/style:${PORTSDIR}/graphics/wmicons

MAKE_JOBS_SAFE=	yes

USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack  pkgconfig
USE_XORG=	xft xinerama xmu xpm xrandr
USE_PERL5=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd7.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -DHAVE_SYS_SELECT_H" \
		LDFLAGS="-L${LOCALBASE}/lib -lintl"
CONFIGURE_ARGS=	--with-pixmapdir=${PREFIX}/include/X11/pixmaps \
		--with-nlsdir=${PREFIX}/share/locale \
		--with-libs-from="-L${LOCALBASE}/lib" \
		--with-incs-from="-I${LOCALBASE}/include" \
		--with-gnustepdir="${PREFIX}/GNUstep" \
		--enable-modelock --enable-xrandr \
		--enable-xinerama --enable-usermenu \
		--disable-debug \
		--with-x
USE_LDCONFIG=	yes

CONFLICTS=	libwraster-0.*

MANLANG=	"" sk
MAN1=		geticonset.1x getstyle.1x seticons.1x setstyle.1x wdwrite.1x \
		wmaker.1x wmsetbg.1x wxcopy.1x wxpaste.1x

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ENV+=	ac_cv_c_inline_asm=no
.endif

CONFIGURE_ENV+=	LINGUAS="${LINGUAS}"
PLIST_SUB=+	WM_LINGUAS=""
LINGUAS=	be bg bs ca cs da de el es et fi fr gl hr hu hy it ja ko ms nl no pl pt ro ru sk sv tr zh_CN zh_TW

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/WPrefs.app/Paths.c
	@${REINPLACE_CMD} -e "s|%%PERL%%|${PERL}|g" ${WRKSRC}/util/wm-oldmenu2new
	@${REINPLACE_CMD} -e "s|Trebuchet MS,Luxi Sans|sans|g" ${WRKSRC}/WindowMaker/Defaults/WMGLOBAL
	@${REINPLACE_CMD} -e "s|/usr/local/GNUstep|${PREFIX}/GNUstep/Local|g" \
		${WRKSRC}/WindowMaker/*menu*
	@(for file in `grep -rl windowmaker\.org ${WRKSRC}`; do \
	${REINPLACE_CMD} -e "s|windowmaker\.org|windowmaker\.info|g" $$file; \
	done)
	@${REINPLACE_CMD} -e '/\/usr\/X11R6\/include\/X11\/pixmaps/d' \
	    -e '/\/usr\/share\/pixmaps/d' \
	    -e "s#\"/usr/local/share/pixmaps\",#\"${PREFIX}/share/pixmaps\"#" \
	    -e "s#/usr/share/icons#${PREFIX}/share/icons#" \
	    ${WRKSRC}/WindowMaker/Defaults/WindowMaker.in
	@${REINPLACE_CMD} -e "s#/usr/include/X11#${PREFIX}/share#" \
	    ${WRKSRC}/WPrefs.app/Paths.c
	@${REINPLACE_CMD} -e "s#WPrefs#${PREFIX}/GNUstep/Applications/WPrefs.app/WPrefs#" \
	    ${WRKSRC}/util/wmgenmenu.c

post-install:
	@${MKDIR} ${PREFIX}/share/WindowMaker/Sounds
	@${MKDIR} -p ${PREFIX}/etc/dm/Sessions
	${CP} ${FILESDIR}/wmaker.desktop ${PREFIX}/etc/dm/Sessions

update-LINGUAS: extract
	cd ${WRKSRC}/po && \
		${ECHO_CMD} *.po | ${SED} 's|\.po||g' > ${FILESDIR}/LINGUAS

.include <bsd.port.post.mk>
