PORTNAME=	uim
PORTVERSION=	1.9.6
CATEGORIES?=	textproc
.if !defined(UIM_SLAVE) && defined(WITHOUT_X11)
PKGNAMESUFFIX=	-nox11
.endif

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Input method library
WWW=		https://github.com/uim/uim

LICENSE=	bsd3 gpl2+ gpl3+ lgpl2.1+ publicdom
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_riscv64=		fails to configure: ./include/private/gcconfig.h:492:5: The collector has not been ported to this machine/OS combination

USES+=		autoreconf:build,2.69 gettext gmake gnome iconv libedit \
		libtool pathfix pkgconfig sqlite
USE_LDCONFIG=	yes
USE_GNOME+=	glib20 intltool

USE_GITHUB=	yes
GH_TUPLE=	uim:sigscheme:ccf1f92:sigscheme \
		uim:libgcroots:f019129:libgcroots

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS+=	--enable-maintainer-mode

OPTIONS_DEFINE=	DOCS X11
OPTIONS_DEFAULT=	X11

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MX11}
USES+=		xorg
USE_XORG+=	x11 xext
LIB_DEPENDS+=	libXft.so:x11-fonts/libXft
CONFIGURE_ARGS+=	--with-x --with-xft
.endif

.if !defined(UIM_SLAVE)
USES+=		perl5 ruby:build
USE_GNOME+=	librsvg2:build
USE_PERL5=	build
RUN_DEPENDS=	${LOCALBASE}/share/skk/SKK-JISYO.L:japanese/skk-jisyo
.if ${PORT_OPTIONS:MX11}
USE_GNOME+=	cairo gdkpixbuf gtk30
LIB_DEPENDS+=	libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig \
		libharfbuzz.so:print/harfbuzz
CONFIGURE_ARGS+=	--with-gtk3 --enable-default-toolkit=gtk3
.endif
CONFIGURE_ARGS+=	--enable-emacs --with-sj3 --with-canna --with-prime
.endif

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS+=	-I${LOCALBASE}/include

.if !defined(UIM_SLAVE)
DOCSDIR_JA=	${PREFIX}/share/doc/ja/uim
DOCSDIR_SIGSCHEME=	${PREFIX}/share/doc/uim/sigscheme
PLIST_SUB+=	DOCSDIR_JA="${DOCSDIR_JA:S,^${PREFIX}/,,}" \
		DOCSDIR_SIGSCHEME="${DOCSDIR_SIGSCHEME:S,^${PREFIX}/,,}"
.endif

.if empty(PORT_OPTIONS:MX11)
PLIST_SUB+=	X11="@comment "
.else
PLIST_SUB+=	X11=""
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=	--enable-storage=fatty
.endif

.for _x in x xft gtk2 gtk3 qt5 qt6 anthy canna m17nlib prime scim dict
.if ${CONFIGURE_ARGS:M--with-${_x}} == ""
CONFIGURE_ARGS+=--without-${_x}
.endif
.endfor
.for _x in gnome-applet kde-applet emacs pref
.if ${CONFIGURE_ARGS:M--enable-${_x}} == ""
CONFIGURE_ARGS+=--disable-${_x}
.endif
.endfor

post-extract:
	${CP} -R ${WRKSRC_sigscheme}/* ${WRKSRC}/sigscheme
	${MKDIR} ${WRKSRC}/sigscheme/libgcroots
	${CP} -R ${WRKSRC_libgcroots}/* ${WRKSRC}/sigscheme/libgcroots

post-patch:
.for f in predict-custom.scm predict-look-skk.scm
	${REINPLACE_CMD} -e 's|%PREFIX%|${PREFIX}|g' ${WRKSRC}/scm/${f}
.endfor

pre-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ./autogen.sh

do-build:
.if !defined(UIM_SLAVE)
.for d in replace sigscheme uim scm xim po fep emacs pixmaps tables
	cd ${WRKSRC}/${d} && ${MAKE_CMD}
.endfor
.if ${PORT_OPTIONS:MX11}
	cd ${WRKSRC}/gtk3/candwin && ${MAKE_CMD}
.endif
.endif

do-install:
.if !defined(UIM_SLAVE)
	cd ${WRKSRC} && ${MAKE_CMD} DESTDIR=${FAKE_DESTDIR} install-data-am
.for d in sigscheme uim scm xim fep emacs pixmaps tables
	cd ${WRKSRC}/${d} && ${MAKE_CMD} DESTDIR=${FAKE_DESTDIR} install-strip
.endfor
	cd ${WRKSRC}/po && ${MAKE_CMD} DESTDIR=${FAKE_DESTDIR} install
.if ${PORT_OPTIONS:MX11}
	cd ${WRKSRC}/gtk3/candwin && ${MAKE_CMD} DESTDIR=${FAKE_DESTDIR} install-strip
.endif
.endif

.if !defined(UIM_SLAVE)
post-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/helperdata
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${MKDIR} ${STAGEDIR}${DOCSDIR_JA}
	${INSTALL_DATA} ${WRKSRC}/doc/KEY ${STAGEDIR}${DOCSDIR}/KEY
	${INSTALL_DATA} ${WRKSRC}/fep/README ${STAGEDIR}${DOCSDIR}/README.fep
	${INSTALL_DATA} ${WRKSRC}/fep/README ${STAGEDIR}${DOCSDIR}/README.key
	${INSTALL_DATA} ${WRKSRC}/fep/README.ja ${STAGEDIR}${DOCSDIR_JA}/README.fep
	${INSTALL_DATA} ${WRKSRC}/xim/README ${STAGEDIR}${DOCSDIR}/README.xim
.endif

.include <bsd.port.post.mk>
