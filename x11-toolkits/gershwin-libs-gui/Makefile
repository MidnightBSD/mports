PORTNAME=	libs-gui
DISTVERSION=	20260129
CATEGORIES=	x11-toolkits gnustep
PKGNAMEPREFIX=	gershwin-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI library
WWW=		http://www.gnustep.org/

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

LIB_DEPENDS+=	libtiff.so:graphics/tiff \
		libpng.so:graphics/png \
		libgif.so:graphics/giflib \
		libicui18n.so:devel/icu \
		libsndfile.so:audio/libsndfile \
		libao.so:audio/libao \
		libflite.so:audio/flite

USES=		gershwin jpeg pkgconfig xorg
CONFLICTS=	gnustep-gui
USE_GERSHWIN=	base build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}
USE_XORG=	x11 xt

USE_GITHUB=	yes
GH_ACCOUNT=	gnustep
GH_TAGNAME=	8be638c0b

GNU_CONFIGURE=	yes

MAKE_FLAGS+=	OPTFLAG="${CFLAGS}"

PLIST_SUB+=	BASEVERSION=${PORTVERSION:C/[.][0-9]*$//1}

OPTIONS_DEFINE=	ASPELL CUPS MOVIE
OPTIONS_DEFAULT=	CUPS MOVIE
OPTIONS_SUB=	yes

CUPS_CONFIGURE_ENABLE=		cups
CUPS_LIB_DEPENDS+=	libcups.so:print/cups
ASPELL_LIB_DEPENDS=	libaspell.so:textproc/aspell
ASPELL_CONFIGURE_ENABLE=	aspell

MOVIE_DESC=		NSMovie/NSMovieView support via FFmpeg
MOVIE_LIB_DEPENDS=	libavcodec.so:multimedia/ffmpeg
MOVIE_CONFIGURE_ENABLE=	movie

pre-configure:
.for file in config.guess config.sub install-sh
	@${CP} ${GNUSTEP_PREFIX}/System/Library/Makefiles/${file} ${WRKSRC}
.endfor

.include <bsd.port.mk>
