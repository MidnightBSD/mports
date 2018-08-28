# $MidnightBSD$

PORTNAME=	gv
PORTVERSION=	3.7.4
PORTREVISION=	2
CATEGORIES=	print
MASTER_SITES=	GNU/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PostScript and PDF previewer

LICENSE=	gpl3

LIB_DEPENDS=	libXaw3d.so:${PORTSDIR}/x11-toolkits/Xaw3d

USES=		cpe ghostscript:x11 iconv gmake perl5 shebangfix
USE_PERL5=	build
USE_XORG=	xpm ice sm xext xmu x11
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV +=	LDFLAGS="${LDFLAGS}" LIBS="${ICONV_LIB}"
CONFIGURE_ARGS+=	--libdir=${PREFIX}/lib/X11 \
			--enable-setenv-code \
			--enable-SIGCHLD-fallback
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
