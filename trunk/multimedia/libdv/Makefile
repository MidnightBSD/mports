# $MidnightBSD$
# $FreeBSD: ports/multimedia/libdv/Makefile,v 1.36 2006/12/15 13:29:55 nork Exp $

PORTNAME=	libdv
PORTVERSION=	1.0.0
CATEGORIES=	multimedia
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quasar DV codec (libdv): software codec for DV video encoding format

LICENSE=	lgpl2.1

LIB_DEPENDS=	libpopt.so:devel/popt

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-gtk --program-prefix=''
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}" \
		PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${LOCALBASE}/libdata/pkgconfig
USES=		jpeg libtool pathfix pkgconfig
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS COPYING COPYRIGHT ChangeLog NEWS README \
		README.dvconnect README.encoder TODO

OPTIONS+=	SDL	"Add SDL support" off

.include <bsd.port.pre.mk>

# XXX - work around compiler bug
# Optimizations -O{1,s,2,3} work
# However, lack of -O{1,s,2,3} or -O0 BREAK the build
# Therefore, make sure we have AT LEAST -O and avoid -O0
CONFIGURE_ENV+=	CFLAGS="-O ${CFLAGS:N-O0}"

.if defined(WITH_SDL)
USE_SDL=	sdl
CONFIGURE_ARGS+=	--enable-sdl
.endif

post-patch:
	@${REINPLACE_CMD} -E \
		-e 's|(pkgconfigdir =).+(/pkgconfig)|\1 ${PREFIX}/libdata\2|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|stdint.h|sys/types.h|' \
		${WRKSRC}/libdv/dv.h \
		${WRKSRC}/libdv/dv_types.h \
		${WRKSRC}/libdv/headers.c \
		${WRKSRC}/libdv/encode.c
	@${REINPLACE_CMD} -E -e 's|^void swab.+$$||' ${WRKSRC}/libdv/encode.c
	@${REINPLACE_CMD} -e 's|SDL/||' ${WRKSRC}/playdv/display.h
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' ${WRKSRC}/encodedv/dvavi.c \
		${WRKSRC}/encodedv/dvconnect.c
# XXX - revise at every port update
# protect popt from prefix changes
	@${REINPLACE_CMD} -E -e 's|(@REQUIRES_NOPKGCONFIG@)|-L${LOCALBASE}/include \1|' \
		${WRKSRC}/libdv.pc.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
