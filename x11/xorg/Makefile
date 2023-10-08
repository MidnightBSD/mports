PORTNAME=	xorg
PORTVERSION=	7.7
PORTREVISION=	4
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org complete distribution metaport
WWW=		https://www.x.org/

LICENSE=	agg

NO_BUILD=	yes
NO_MTREE=	yes

RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri

# data
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xbitmaps.pc:x11/xbitmaps \
		${LOCALBASE}/share/icons/handhelds/cursors/X_cursor:x11-themes/xcursor-themes

OPTIONS_DEFINE=	DOCS

DOCS_RUN_DEPENDS+=	${LOCALBASE}/share/doc/xorg-docs/README.xml:x11/xorg-docs

# app, lib, font, driver
RUN_DEPENDS+=	xorg-apps>0:x11/xorg-apps \
		xorg-libraries>0:x11/xorg-libraries \
		xorg-fonts>0:x11-fonts/xorg-fonts \
		xorg-drivers>0:x11-drivers/xorg-drivers

.if defined(XORG_COMPLETE)
RUN_DEPENDS+=	Xnest:x11-servers/xorg-server@xnest \
		Xvfb:x11-servers/xorg-server@xvfb
.endif

do-install:	# empty

.include <bsd.port.pre.mk>

.if make(package)
.if !defined(DEPENDS_TARGET:Mpackage) || empty(DEPENDS_TARGET:Mpackage)
DEPENDS_TARGET="package"
.endif
.endif

.include <bsd.port.post.mk>
