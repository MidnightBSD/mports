# New ports collection makefile for:	libxklavier
# Date created:				31 May 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/x11/libxklavier/Makefile,v 1.1 2007/10/20 07:01:46 laffer1 Exp $
# $FreeBSD: ports/x11/libxklavier/Makefile,v 1.35 2007/05/19 20:27:03 flz Exp $
#   $MCom: ports/x11/libxklavier/Makefile,v 1.32 2007/02/24 21:00:46 mezz Exp $
#

PORTNAME=	libxklavier
PORTVERSION=	3.5
PORTREVISION=	0
PORTEPOCH=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	gswitchit

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An utility library to make XKB stuff easier
LICENSE=	lgpl

RUN_DEPENDS=	xkbcomp:${PORTSDIR}/x11/xkbcomp

USE_XORG=	x11 xkbfile
USE_GMAKE=	yes
USE_GNOME=	gnometarget gnomehack libxml2 glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ARGS=	--disable-doxygen \
		--with-xkb-base=${LOCALBASE}/share/X11/xkb \
		--with-xkb-bin-base=${LOCALBASE}/bin \
		--with-xmodmap-base=${LOCALBASE}/share/xmodmap \
		--disable-gtk-doc \
		--with-html-dir=${GNOME_HTML_DIR}
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|== "yes|= "yes|g' \
		${WRKSRC}/configure


.include <bsd.port.mk>
