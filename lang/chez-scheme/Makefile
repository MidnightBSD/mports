PORTNAME=	chez-scheme
PORTVERSION=	10.4.0
DISTVERSIONPREFIX=	v
CATEGORIES=	lang
MASTER_SITES=	https://github.com/cisco/ChezScheme/releases/download/${DISTVERSIONPREFIX}${DISTVERSION}/
DISTNAME=	csv${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Chez Scheme system
WWW=		https://cisco.github.io/ChezScheme

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	amd64 i386 aarch64 armv7
BROKEN_armv7=	No suitable machine type found in "./boot".

LIB_DEPENDS=	libuuid.so:misc/libuuid

USES=		gmake iconv:lib ncurses

OPTIONS_DEFAULT=	X11
OPTIONS_DEFINE=	X11

HAS_CONFIGURE=	yes
ALL_TARGET=	build
CONFLICTS_INSTALL=	petite-chez
STRIP_FILES=	bin/petite bin/${PORTNAME} bin/${PORTNAME}-script
CHEZ_LIBDIR=	lib/${DISTNAME}
CFLAGS+=	-fPIC
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -luuid
CONFIGURE_ARGS=	-m=${CHEZ_ARCH} \
		--installprefix=${TRUE_PREFIX} \
		--temproot=${FAKE_DESTDIR} \
		--installschemename=${PORTNAME} \
		--installscriptname=${PORTNAME}-script \
		--installman=${TRUE_PREFIX}/share/man \
		--threads
PLIST_SUB=	PORTNAME=${PORTNAME} \
		CHEZ_ARCH=${CHEZ_ARCH} \
		CHEZ_LIBDIR=${CHEZ_LIBDIR}
X11_USES=	xorg
X11_USE=	XORG=x11

.include <bsd.port.pre.mk>

.if (${ARCH} == "amd64")
CHEZ_ARCH=	ta6fb
.elif (${ARCH} == "i386")
CHEZ_ARCH=	ti3fb
.elif (${ARCH} == "aarch64")
CHEZ_ARCH=	tarm64fb
.elif (${ARCH} == "armv7")
CHEZ_ARCH=	tarm32fb
.endif

.if defined(NCURSES_RPATH)
NCURSES_REPL=	-e 's|-Wl,-rpath,${NCURSESRPATH}||g'
.else
NCURSES_REPL=
.endif

pre-configure:
	${REINPLACE_CMD} -e 's,/usr/X11R6,${LOCALBASE},g' \
		-e 's,/usr/local,${LOCALBASE},g' ${NCURSES_REPL} \
		-e 's,-liconv,${ICONV_LIB},g' ${WRKSRC}/configure

pre-build-X11-off:
	${ECHO_CMD} '#undef LIBX11' >>${WRKSRC}/c/version.h

post-install:
.for f in ${STRIP_FILES}
	@${CHMOD} +w ${PREFIX}/${f}
	@${STRIP_CMD} ${PREFIX}/${f}
	@${CHMOD} -w ${PREFIX}/${f}
.endfor

.include <bsd.port.post.mk>
