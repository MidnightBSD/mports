PORTNAME=	jvim
PORTVERSION=	3.0.j2.1b
PORTREVISION=	0
CATEGORIES=	japanese editors
MASTER_SITES=	ftp://ftp.vim.org/pub/vim/unix/ \
		http://hp.vector.co.jp/authors/VA003457/vim/vim3/2.1b/
DISTFILES=	vim-3.0.tar.gz jvim.2.1b.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanized Vim-3.0
WWW=		https://hp.vector.co.jp/authors/VA003457/vim/

LICENSE=	publicdom

FAKE_OPTS=	trueprefix

EXTRA_PATCHES=	${WRKDIR}/${PORTNAME}.diff
WRKSRC=		${WRKDIR}/vim
BUILD_WRKSRC=	${WRKSRC}/src
INSTALL_WRKSRC=	${WRKSRC}/src
MAKEFILE=	makjunix.mak
ALL_TARGET=	# empty
PLIST_SUB=	VERSION=${PORTVERSION}
MAKE_ARGS=	FEPOPT='${FEPOPT}' \
		FEPLIBS="${FEPLIBS}" \
		FEPOBJS="${FEPOBJS}" \
		LIBS="${LIBS}"

OPTIONS_DEFINE=	X11 DOCS
OPTIONS_DEFAULT=X11
OPTIONS_RADIO=	FEP
OPTIONS_RADIO_FEP=	DIRECT_CANNA WNN6 WNN7
FEP_DESC=	Japanese FrontEnd Processor
DIRECT_CANNA_DESC=	Canna support (direct)
DIRECT_CANNA_LIB_DEPENDS=	libcanna.so:japanese/canna-lib
WNN6_DESC=	Wnn6 support
WNN6_LIB_DEPENDS=	libjd.so:japanese/FreeWnn-lib
WNN6_BUILD_DEPENDS=	${LOCALBASE}/lib/libonew-wnn6.a:japanese/onew
WNN7_DESC=	Wnn7 support
WNN7_LIB_DEPENDS=	libjd.so:japanese/FreeWnn-lib
WNN7_BUILD_DEPENDS=	${LOCALBASE}/lib/libonew-wnn7.a:japanese/onew

PORTDOCS=	cygwin.txt differen.doc fepctrl.doc readme.doc \
		termcap.dos uganda.jp vim-jp.htm vim32.ini tutor.j

CPPFLAGS+=	-DBSD_UNIX -DUSE_LOCALE
LIBS+=		-ltermlib -L${LOCALBASE}/lib

X11_USES=	xorg
X11_USE=	XORG=x11
X11_CPPFLAGS=	-DUSE_X11 -I${LOCALBASE}/include
X11_LIBS=	-lX11 -L${LOCALBASE}/lib

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDIRECT_CANNA} || \
    ${PORT_OPTIONS:MWNN6} || \
    ${PORT_OPTIONS:MWNN7}
FEPOPT+=	-DJP_DEF=\"EEE\" -DFEPCTRL
.endif

#  Direct connection to Canna
.if ${PORT_OPTIONS:MDIRECT_CANNA}
FEPOPT+=	-DCANNA
FEPLIBS=	-lcanna -L${LOCALBASE}/lib
FEPOBJS=	fepcanna.o
JVIM3RC=	"set fepctrl"
.endif

.if ${PORT_OPTIONS:MWNN6} || \
    ${PORT_OPTIONS:MWNN7} || \
    ${PORT_OPTIONS:MDIRECT_CANNA}
FEPOPT+=	-DONEW
FEPOBJS=	feponew.o
JVIM3RC=	"set fepctrl onewredraw"
.endif

.if ${PORT_OPTIONS:MWNN6}
FEPLIBS+=	-lonew-wnn6 -ljd -lcrypt
.endif

.if ${PORT_OPTIONS:MWNN7}
FEPLIBS+=	-lonew-wnn7 -ljd -lcrypt
.endif

post-build:
	${INSTALL_DATA} ${WRKSRC}/doc.j/tutor/tutor.j ${WRKSRC}/doc.j
	${ECHO_CMD} "${JVIM3RC}" > ${WRKSRC}/jvim3rc.dist

post-install:
	${LN} -sf jvim3 ${STAGEDIR}${PREFIX}/bin/jvim
	${INSTALL_PROGRAM} ${WRKSRC}/src/grep.bin ${STAGEDIR}${PREFIX}/bin/jgrep
	${INSTALL_DATA} ${WRKSRC}/jvim3rc.dist ${STAGEDIR}${PREFIX}/etc/
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC}/doc.j && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
