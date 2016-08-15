# $MidnightBSD$
# $FreeBSD: ports/graphics/goocanvas/Makefile,v 1.14 2010/12/04 07:31:58 ade Exp $

PORTNAME=	goocanvas
PORTVERSION=	1.0.0
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Canvas widget for GTK+

LICENSE=	lgpl

USES=		libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS NLS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|$${datadir}/gtk-doc/html|${DOCSDIR}|' \
		${WRKSRC}/configure
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e '/^SUBDIRS/s|docs||g' ${WRKSRC}/Makefile.in
.endif
.if ! ${PORT_OPTIONS:MNLS}
	@${REINPLACE_CMD} -e '/^SUBDIRS/s|po||g' ${WRKSRC}/Makefile.in
.endif
 
post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libgoocanvas.so.*

.include <bsd.port.mk>
