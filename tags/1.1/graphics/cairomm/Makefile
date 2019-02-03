# $MidnightBSD$

PORTNAME=	cairomm
PORTVERSION=	1.10.0
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interface to cairo

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		gmake libtool pathfix pkgconfig
USE_GNOME=	cairo libxml++26
CONFIGURE_ENV=	AUTOMAKE="${TRUE}" AUTOCONF="${TRUE}" DOXYGEN="${TRUE}"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS

DOCS_CONFIGURE_ARGS_OFF=	--disable-documentation

.include <bsd.mport.options.mk>

.if empty(PORT_OPTIONS:MDOCS)
post-configure:
	@${TOUCH} -f ${WRKSRC}/docs/reference/html/index.html
.endif

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libcairomm-1.0.so.1.4.0

.include <bsd.port.mk>
