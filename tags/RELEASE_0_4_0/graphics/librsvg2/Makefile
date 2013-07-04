# New ports collection makefile for:    librsvg2
# Date created:         		8th May 2001
# Whom:                 		Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/librsvg2/Makefile,v 1.6 2011/02/02 21:04:18 laffer1 Exp $
# $FreeBSD: ports/graphics/librsvg2/Makefile,v 1.59 2007/07/27 15:50:29 mezz Exp $
#   $MCom: ports/graphics/librsvg2/Makefile,v 1.109 2006/10/02 04:52:51 bland Exp $
#

PORTNAME=	librsvg2
PORTVERSION=	2.34.1
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/librsvg/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	librsvg-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for parsing and rendering SVG vector-graphic files
LICENSE=	gpl2

BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2
LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		croco-${CROCO_VERSION}.3:${PORTSDIR}/textproc/libcroco
RUN_DEPENDS=	gtk-engines2>=2.7.5_1:${PORTSDIR}/x11-themes/gtk-engines2

USE_XZ=		yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack gnomeprefix libgsf ltverhack gtk20
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-svgz \
		--with-croco \
		--enable-gtk-theme
CROCO_VERSION=	0.6
MAN1=		rsvg.1

post-patch:
	@${REINPLACE_CMD} -e 's|GTK3_REQUIRED=2.90.0|GTK3_REQUIRED=9.90.0|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
