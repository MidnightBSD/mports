# Created by: Andrey Zakhvatov

PORTNAME=	ncurses
DISTVERSION=	6.3
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.invisible-island.net/${PORTNAME}/ \
		https://invisible-mirror.net/archives/ncurses/
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for terminal-independent, full-screen output

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_sparc64=	cannot build: coredump: illegal instruction

USES=		cpe pkgconfig shebangfix

GNU_CONFIGURE=		yes
CONFIGURE_ARGS=		--datadir=${PREFIX}/share \
			--with-terminfo-dirs="${PREFIX}/share/terminfo:${LOCALBASE}/share/site-terminfo" \
			--disable-home-terminfo \
			--disable-overwrite \
			--disable-root-environ \
			--disable-lib-suffixes \
			--disable-db-install \
			--enable-bsdpad \
			--enable-colorfgbg \
			--enable-getcap \
			--enable-pc-files \
			--enable-rpath \
			--enable-termcap \
			--enable-widec \
			--includedir=${PREFIX}/include/ncurses \
			--program-prefix= \
			--without-hashed-db \
			--with-manpage-format=gzip \
			--with-pkg-config-libdir=${PREFIX}/libdata/pkgconfig \
			--with-pkg-config=yes \
			--with-shared \
			--with-termlib \
			--without-manpage-renames
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

OPTIONS_DEFINE=		DEBUG DOCS EXAMPLES MANPAGES PROFILE TRACE
OPTIONS_DEFAULT=	DOCS EXAMPLES MANPAGES

TRACE_DESC=	Add trace() function to all models of ncurses

CONFIGURE_ENV=	gnat_exists="no" cf_cv_ld_searchpath="${LOCALBASE}/lib /usr/lib /lib"

USE_LDCONFIG=	yes
CPE_VENDOR=	gnu
SHEBANG_FILES=	test/tracemunch

PLIST_SUB+=	ABI_VER=6 \
		REL_VER=${DISTVERSION}

PORTDOCS=	*
PORTEXAMPLES=	*

DOCS=		ANNOUNCE doc/hackguide.doc doc/html/announce.html \
		doc/html/hackguide.html doc/html/index.html \
		doc/html/ncurses-intro.html doc/ncurses-intro.doc INSTALL NEWS \
		README TO-DO
EXAMPLES=	blue.c bs.6 bs.c cardfile.c cardfile.dat ditto.c dots.c \
		filter.c firework.c firstlast.c gdc.6 gdc.c hanoi.c hashtest.c \
		knight.c lrtest.c Makefile ncurses.c newdemo.c railroad.c \
		rain.c README tclock.c test.priv.h testaddch.c testcurs.c \
		testscanw.c view.c worm.c xmas.c
EXAMPLES_CPP=	cursesapp.cc cursesapp.h cursesf.cc cursesf.h cursesm.cc \
		cursesm.h cursesmain.cc cursesp.cc cursesp.h cursesw.cc \
		cursesw.h cursslk.cc cursslk.h demo.cc etip.h internal.h \
		Makefile NEWS PROBLEMS README-first

TRACE_CONFIGURE_ON=		--with-trace
PROFILE_CONFIGURE_WITH=		profile
MANPAGES_CONFIGURE_WITH=	manpages
DEBUG_CONFIGURE_WITH=		debug

OPTIONS_SUB=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMANPAGES}
PLIST_SUB+=	MANPAGES=""
.else
PLIST_SUB+=	MANPAGES="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/misc/ncurses-config.in

post-install:
	${RM} ${STAGEDIR}${PREFIX}/lib/libncurses.so
	${ECHO} "INPUT(libncurses.so.${PORTVERSION:R} AS_NEEDED(-ltinfo))" > ${STAGEDIR}${PREFIX}/lib/libncurses.so

	${STRIP_CMD} ${PREFIX}/lib/*.so.${DISTVERSION}

	# backwards compatibility
	${RLN} ${STAGEDIR}${PREFIX}/lib/libncurses.so ${STAGEDIR}${PREFIX}/lib/libncursesw.so
	${RLN} ${STAGEDIR}${PREFIX}/libdata/pkgconfig/ncurses.pc ${STAGEDIR}${PREFIX}/libdata/pkgconfig/ncursesw.pc

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

.include <bsd.port.mk>
