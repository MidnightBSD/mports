# New ports collection makefile for:	libxklavier
# Date created:				31 May 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/x11/libxklavier/Makefile,v 1.5 2011/02/02 21:35:02 laffer1 Exp $
# $FreeBSD: ports/x11/libxklavier/Makefile,v 1.35 2007/05/19 20:27:03 flz Exp $
#   $MCom: ports/x11/libxklavier/Makefile,v 1.32 2007/02/24 21:00:46 mezz Exp $
#

PORTNAME=	libxklavier
PORTVERSION=	5.0
PORTEPOCH=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An utility library to make XKB stuff easier
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
RUN_DEPENDS=	xkbcomp:${PORTSDIR}/x11/xkbcomp \
    		${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes

USE_XORG=	x11 xkbfile
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack libxml2 glib20 ltverhack:12
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ARGS=	--disable-doxygen \
		--with-xkb-base=${LOCALBASE}/share/X11/xkb \
		--with-xkb-bin-base=${LOCALBASE}/bin \
		--with-xmodmap-base=${LOCALBASE}/share/xmodmap \
		--disable-gtk-doc \
		--with-html-dir=${GNOME_HTML_DIR}
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|== "yes|= "yes|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
