# New ports collection makefile for:	openbox
# Date created:				2002-04-28
# Whom:					trevor
# based on the blackbox port
#
# $MidnightBSD: mports/x11-wm/openbox/Makefile,v 1.3 2008/03/05 04:38:36 laffer1 Exp $
# $FreeBSD: ports/x11-wm/openbox/Makefile,v 1.74 2006/09/02 10:04:56 novel Exp $
#

PORTNAME=	openbox
PORTVERSION=	3.4.7.2
CATEGORIES=	x11-wm
MASTER_SITES=	http://offload1.icculus.org/openbox/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A standards compliant, fast, light-weight, extensible window manager
LICENSE=        gpl2
LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft

USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 libxml2 ltverhack
USE_XLIB=	yes
USE_LDCONFIG=	yes

CONFIGURE_ENV=	CFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
MAN1=	openbox.1 openbox-session.1 \
	openbox-gnome-session.1 openbox-kde-session.1

#.if !defined(WITHOUT_NLS)
#USE_GETTEXT=	yes
#PLIST_SUB+=	NLS=""
#.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
#.endif

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
