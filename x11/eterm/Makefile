PORTNAME=	eterm
PORTVERSION=	0.9.6
PORTREVISION=	10
CATEGORIES+=	x11
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/Eterm-${PORTVERSION}
DISTNAME=	Eterm-${PORTVERSION}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	X11 terminal emulator based on rxvt/xterm
WWW=		http://www.eterm.org/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	man2html:textproc/man2html
LIB_DEPENDS=	libast.so:devel/libast \
		libImlib2.so:graphics/imlib2

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS?=--enable-trans --enable-utmp \
		--enable-xim --with-theme-update \
		--with-backspace=bs --without-terminfo \
		--enable-multi-charset

.if exists(/usr/libexec/gdb)
CONFIGURE_ENV=	GDB=/usr/libexec/gdb
.else
CONFIGURE_ENV=	GDB=/usr/bin/gdb
.endif

CFLAGS+=	-Wno-int-conversion
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USES=		cpe iconv libtool shebangfix xorg
SHEBANG_FILES=	${WRKSRC}/utils/kEsetroot.in
perl_OLD_CMD=	@PERL@
USE_CSTD=	gnu89
USE_LDCONFIG=	yes
USE_XORG=	x11 xt
CPE_VENDOR=	eterm_project

CONFLICTS_INSTALL?=	ja-eterm zh-eterm

OPTIONS_DEFINE=	DOCS
OPTIONS_DEFINE_i386=	MMX

MMX_CONFIGURE_WITH=	mmx

post-patch:
	@${FIND} ${WRKSRC} -name '*.orig' -delete

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ReleaseNotes ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/Eterm_reference.html ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
