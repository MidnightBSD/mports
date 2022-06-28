PORTNAME=	m17n-lib
PORTVERSION=	1.6.4
CATEGORIES=	devel
MASTER_SITES=	http://www.m17n.org/m17n-lib-download/ \
		http://anthesphoria.net/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for multilingual text handling

LICENSE=	lgpl2.1

BUILD_DEPENDS=	bison:devel/bison \
		m17n-db>=1.6.2:devel/m17n-db
LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libfribidi.so:converters/fribidi \
		libgd.so:graphics/gd \
		libotf.so:print/libotf
RUN_DEPENDS=	m17n-db>=1.6.2:devel/m17n-db

MAKE_JOBS_UNSAFE=	yes

USES=		autoreconf bison:alias gettext-tools gnome libtool pathfix pkgconfig \
		xorg
USE_XORG=	ice sm x11 xaw xft xmu xrender xt
USE_GNOME=	libxml2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--disable-nls
BINARY_ALIAS=	freetype-config=true

OPTIONS_DEFINE=	ANTHY ISPELL THAI

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--disable-nls

CONFIGURE_ARGS+=	--without-anthy

ISPELL_BUILD_DEPENDS=	ispell:textproc/aspell-ispell
ISPELL_RUN_DEPENDS=	ispell:textproc/aspell-ispell
ISPELL_CONFIGURE_OFF=	HAVE_ISPELL=no

THAI_LIB_DEPENDS=	libthai.so:devel/libthai
THAI_CONFIGURE_OFF=	--without-libthai

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|g ; \
		 s|-ldl||g'

.include <bsd.port.post.mk>
