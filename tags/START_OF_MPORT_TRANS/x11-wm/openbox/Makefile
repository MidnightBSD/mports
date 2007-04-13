# New ports collection makefile for:	openbox
# Date created:				2002-04-28
# Whom:					trevor
# based on the blackbox port
#
# $MidnightBSD: mports/x11-wm/openbox/Makefile,v 1.1 2006/10/08 15:57:25 wintellect Exp $
# $FreeBSD: ports/x11-wm/openbox/Makefile,v 1.74 2006/09/02 10:04:56 novel Exp $
#

PORTNAME=	openbox
PORTVERSION=	3.3.1
PORTREVISION=   1
CATEGORIES=	x11-wm
MASTER_SITES=	http://offload1.icculus.org/openbox/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A standards compliant, fast, light-weight, extensible window manager

LIB_DEPENDS=	Xft.2:${PORTSDIR}/x11-fonts/libXft

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 libxml2
USE_XLIB=	yes
USE_LDCONFIG=	yes

.if !defined(WITHOUT_PANGO)
USE_GNOME+=	pango
.else
CONFIGURE_ARGS+=	--disable-pango
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

pre-install:
	@${MKDIR} ${PREFIX}/libdata/ldconfig

.include <bsd.port.mk>
