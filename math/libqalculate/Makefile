# $MidnightBSD: mports/math/libqalculate/Makefile,v 1.7 2011/12/15 00:57:50 laffer1 Exp $

PORTNAME=	libqalculate
PORTVERSION=	0.9.7
PORTREVISION=	1
CATEGORIES=	math
MASTER_SITES=	SF/qalculate/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A a multi-purpose desktop calculator (backend library)
LICENSE=	gpl2

LIB_DEPENDS=	cln:${PORTSDIR}/math/cln

USE_PKGCONFIG=	build
USE_GNOME=	glib20 gnomehack intlhack libxml2
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s|docs||g' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's/^GMSGFMT = @GMSGFMT@/GMSGFMT = msgfmt/' ${WRKSRC}/po/Makefile.in.in
	@${REINPLACE_CMD} -e 's/-pthread/${PTHREAD_LIBS}/g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's/-lpthread/${PTHREAD_LIBS}/g' ${WRKSRC}/libqalculate.pc.in

.include <bsd.port.mk>
