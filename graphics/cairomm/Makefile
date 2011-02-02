# $MidnightBSD: mports/graphics/cairomm/Makefile,v 1.4 2009/09/20 01:25:48 laffer1 Exp $

PORTNAME=	cairomm
PORTVERSION=	1.8.0
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interface to cairo
LICENSE=	lgpl

LIB_DEPENDS=	xml\\+\\+-2.6:${PORTSDIR}/textproc/libxml++26 \
		cairo.2:${PORTSDIR}/graphics/cairo

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack gnometarget ltverhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		AUTOMAKE="${TRUE}" AUTOCONF="${TRUE}" DOXYGEN="${TRUE}"

.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--disable-docs

post-patch:
	@${REINPLACE_CMD} -E '/^SUBDIRS = /s/(docs|examples)//g' ${WRKSRC}/Makefile.in
.else
post-configure:
	@${TOUCH} -f ${WRKSRC}/docs/reference/html/index.html
.endif

.include <bsd.port.mk>
