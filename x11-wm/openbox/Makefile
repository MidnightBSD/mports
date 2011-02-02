# $MidnightBSD: mports/x11-wm/openbox/Makefile,v 1.7 2010/08/01 06:49:33 laffer1 Exp $

PORTNAME=	openbox
PORTVERSION=	3.4.11.2
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	http://openbox.org/dist/openbox/ \
		http://dougbarton.us/Downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A standards compliant, fast, light-weight, extensible window manager
LICENSE=        gpl2

LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 libxml2 ltverhack
USE_XORG=	x11
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CFLAGS+="-I${LOCALBASE}/include" \
		LDFLAGS+="-L${LOCALBASE}/lib"
MAN1=		openbox.1 openbox-session.1 obxprop.1 \
		openbox-gnome-session.1 openbox-kde-session.1

PLIST_SUB=	VERSION=${PORTVERSION}

CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "

.if !defined(WITHOUT_PANGO)
USE_GNOME+=	pango
.else
CONFIGURE_ARGS+=	--disable-pango
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

post-configure:
	@${CHMOD} +x ${WRKSRC}/install-sh

pre-install:
	@${MKDIR} ${PREFIX}/libdata/ldconfig

.include <bsd.port.mk>
