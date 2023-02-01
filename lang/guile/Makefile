PORTNAME=	guile
PORTVERSION=	3.0.8
CATEGORIES=	lang scheme
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Ubiquitous Intelligent Language for Extension

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

LIB_DEPENDS=	libffi.so:devel/libffi \
		libgmp.so:math/gmp \
		libltdl.so:devel/libltdl \
		libunistring.so:devel/libunistring

NOT_FOR_ARCHS=	i386

USES=		charsetfix compiler:gcc-c++11-lib cpe gmake iconv libtool makeinfo pathfix pkgconfig \
	readline tar:lz
USE_LDCONFIG=	yes

CPE_VENDOR=	gnu

CONFLICTS_INSTALL=	guile1 guile2

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

INFO=		guile r5rs

PLIST_SUB=	GUILE_VER=${PORTVERSION:R}

OPTIONS_DEFINE=	NLS THREADS
OPTIONS_DEFAULT=NLS THREADS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

THREADS_CONFIGURE_WITH=	threads
THREADS_LIB_DEPENDS=	libgc-threaded.so:devel/boehm-gc-threaded
THREADS_LIB_DEPENDS_OFF=	libgc.so:devel/boehm-gc

post-patch:
	@${REINPLACE_CMD} -e 's|sys/time.h sys/timeb.h|sys/time.h |g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-i -e|-i.bak -e|' \
		${WRKSRC}/libguile/Makefile.in

post-patch-THREADS-on:
	@${REINPLACE_CMD} -e 's|bdw-gc|bdw-gc-threaded|g' ${WRKSRC}/configure

.include <bsd.port.mk>
