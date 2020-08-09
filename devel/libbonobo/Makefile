PORTNAME=	libbonobo
PORTVERSION=	2.32.0
PORTREVISION?=	4
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Component and compound document system for GNOME2

LICENSE=	gpl2

USES+=		tar:bzip2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	libpopt.so:${PORTSDIR}/devel/popt

USES+=		bison gettext gmake libtool:keepla pathfix pkgconfig perl5
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	intlhack libxml2 orbit2 referencehack
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -pthread
MAKE_ENV=	gnomelocaledir=${PREFIX}/share/locale

post-patch:
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/configure \
		${WRKSRC}/activation-server/Makefile.in

.include <bsd.port.mk>

.endif
