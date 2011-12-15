#
# $MidnightBSD: mports/math/libqalculate/Makefile,v 1.6 2011/02/02 21:08:36 laffer1 Exp $
#

PORTNAME=	libqalculate
PORTVERSION=	0.9.7
CATEGORIES=	math
MASTER_SITES=	SF/qalculate/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A a multi-purpose desktop calculator (backend library)
LICENSE=	gpl2

LIB_DEPENDS=	cln.6:${PORTSDIR}/math/cln

USE_GNOME=	glib20 gnomehack  intlhack libxml2
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
	@${REINPLACE_CMD} -e 's/-pthread/${PTHREAD_LIBS}/' ${WRKSRC}/configure

.include <bsd.port.mk>
