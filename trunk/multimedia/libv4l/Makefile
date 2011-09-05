# $MidnightBSD: mports/multimedia/libv4l/Makefile,v 1.1 2010/09/06 21:21:50 laffer1 Exp $

PORTNAME=	libv4l
PORTVERSION=	0.8.1
CATEGORIES=	multimedia
MASTER_SITES=	http://linuxtv.org/downloads/v4l-utils/
DISTNAME=	v4l-utils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux library
LICENSE=	lgpl

BUILD_DEPENDS=	v4l_compat>=1.0.20101027:${PORTSDIR}/multimedia/v4l_compat

MAKE_ARGS=	CFLAGS="${CFLAGS} -I${LOCALBASE}/include" LIBDIR="${PREFIX}/lib"
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

FAKE_OPTS+=	trueprefix
WRKSRC=		${WRKDIR}/${DISTNAME}/lib

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
	@${RM} ${WRKSRC}/../include/linux/videodev2.h

.include <bsd.port.post.mk>
