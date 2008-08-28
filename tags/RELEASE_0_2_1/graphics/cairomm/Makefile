# New ports collection makefile for:	cairomm
# Date created:		2005-12-07
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/cairomm/Makefile,v 1.1 2007/08/29 04:33:03 laffer1 Exp $
# $FreeBSD: ports/graphics/cairomm/Makefile,v 1.9 2007/05/19 20:08:41 flz Exp $
#   $MCom: ports/graphics/cairomm/Makefile,v 1.4 2006/09/06 22:06:40 marcus Exp $

PORTNAME=	cairomm
PORTVERSION=	1.2.4
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/releases/
LICENSE=	lgpl

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interface to cairo

LIB_DEPENDS=	xml\\+\\+-2.6:${PORTSDIR}/textproc/libxml++26 \
		cairo.2:${PORTSDIR}/graphics/cairo

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib" \
		AUTOMAKE="${TRUE}" AUTOCONF="${TRUE}" DOXYGEN="${TRUE}"

.include <bsd.port.pre.mk>

.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--disable-docs

post-patch:
	@${REINPLACE_CMD} -E '/^SUBDIRS = /s/(docs|examples)//g' ${WRKSRC}/Makefile.in
.else
post-configure:
	@${TOUCH} -f ${WRKSRC}/docs/reference/html/index.html
.endif

.include <bsd.port.post.mk>
