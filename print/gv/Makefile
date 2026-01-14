PORTNAME=	gv
PORTVERSION=	3.7.4
PORTREVISION=	4
CATEGORIES=	print
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostScript and PDF previewer
WWW=		https://www.gnu.org/software/gv/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libXaw3d.so:x11-toolkits/libXaw3d

USES=		cpe ghostscript:x11 iconv gmake localbase perl5 pkgconfig \
		shebangfix xorg
USE_PERL5=	build
USE_XORG=	ice sm x11 xext xinerama xmu xpm xt
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV +=	LDFLAGS="${LDFLAGS}" LIBS="${ICONV_LIB}"
CONFIGURE_ARGS+=	--libdir=${PREFIX}/lib/X11 \
			--enable-setenv-code \
			--enable-SIGCHLD-fallback \
			ac_cv_lib_iconv_iconv_open=no
SHEBANG_FILES=	${WRKSRC}/src/gv-update-userconfig.in

CPE_VENDOR=	gnu
INFO=		gv
PLIST_FILES=	bin/gv \
		bin/gv-update-userconfig \
		%%DATADIR%%/gv_system.ad \
		%%DATADIR%%/safe-gs-workdir/.keep_me \
		lib/X11/app-defaults/GV
PLIST_DIRS=	%%DATADIR%%/safe-gs-workdir \
		%%DATADIR%%

post-install:
	@${TOUCH} ${DATADIR}/safe-gs-workdir/.keep_me

.include <bsd.port.mk>
