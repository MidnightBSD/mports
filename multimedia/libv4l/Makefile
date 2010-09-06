# $MidnightBSD$

PORTNAME=	libv4l
PORTVERSION=	0.6.4
CATEGORIES=	multimedia
MASTER_SITES=	http://people.fedoraproject.org/~jwrdegoede/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux library
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/include/linux/videodev2.h:${PORTSDIR}/multimedia/v4l_compat

MAKE_ARGS=	CFLAGS="${CFLAGS} -I${LOCALBASE}/include" LIBDIR="${PREFIX}/lib"
USE_GZIP=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

FAKE_OPTS+=	trueprefix

.include <bsd.port.pre.mk>

post-patch:
.if ${OSVERSION} < 3000
	@${REINPLACE_CMD} -e 's|-fvisibility=hidden||g' -e 's|-lrt||g'  \
		${WRKSRC}/libv4l1/Makefile \
		${WRKSRC}/libv4l2/Makefile \
		${WRKSRC}/libv4lconvert/Makefile
.endif
	@${REINPLACE_CMD} -e 's|$$(LIBDIR)/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
		${WRKSRC}/libv4l1/Makefile \
		${WRKSRC}/libv4l2/Makefile \
		${WRKSRC}/libv4lconvert/Makefile

.include <bsd.port.post.mk>
