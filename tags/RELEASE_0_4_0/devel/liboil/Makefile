# $MidnightBSD: mports/devel/liboil/Makefile,v 1.7 2011/05/21 21:33:37 laffer1 Exp $
# $FreeBSD: ports/devel/liboil/Makefile,v 1.25 2007/03/24 21:50:39 marcus Exp $

PORTNAME=	liboil
PORTVERSION=	0.3.17
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://liboil.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of optimized inner loops
LICENSE=	bsd2

USE_GNOME=	pkgconfig gnomehack ltverhack
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--disable-glib
CFLAGS+=	-O2

.include <bsd.port.pre.mk>

.if defined(WITH_3DNOW_GCC40)
USE_GCC=	4.2+
.endif

pre-everything::
.if ${MACHINE_CPU:M3dnow}!=""
.if !defined(WITH_3DNOW_GCC40)
	@${ECHO_MSG} "You can enable 3dnow extensions by defining"
	@${ECHO_MSG} "WITH_3DNOW_GCC40=yes"
.endif
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Note: ${PORTNAME} will depend on gcc4.0+ with WITH_3DNOW_GCC40"
	@${ECHO_MSG} "defined."
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\\$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|<stdint\.h|<inttypes.h|g' \
		${WRKSRC}/liboil/liboiltypes.h \
		${WRKSRC}/liboil/liboilprofile.h \
		${WRKSRC}/liboil/liboil.h

.include <bsd.port.post.mk>
