# New ports collection makefile for:	mpeg4ip-libmp4v2
# Date created:		28 Sep 2004
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/mpeg4ip-libmp4v2/Makefile,v 1.7 2011/02/02 21:11:11 laffer1 Exp $
# $FreeBSD: ports/multimedia/mpeg4ip-libmp4v2/Makefile,v 1.15 2007/01/27 07:54:19 kris Exp $
#

PORTNAME=	mpeg4ip
PORTVERSION=	1.5.0.1
CATEGORIES=	multimedia
MASTER_SITES=	SF
PKGNAMESUFFIX=	-libmp4v2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mpeg-4 library and tools from mpeg4ip
LICENSE=	agg
#mpl etc

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_GNOME=	
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include -I${X11BASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib -L${X11BASE}/lib ${PTHREAD_LIBS}"
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-patch:
	@${TOUCH} -f ${WRKSRC}/bootstrapped
# Speed up configure by not using 2 unneeded configure scripts.
	@${ECHO_CMD} "" > ${WRKSRC}/lib/rtp/configure
	@${ECHO_CMD} "" > ${WRKSRC}/lib/SDLAudio/configure
	@${REINPLACE_CMD} \
		-e 's|>&/|>/|; s|-Wmissing-declarations||; \
			s|-Wmissing-prototypes||; s|nasm -r|nasm -v|' \
			${WRKSRC}/configure
do-build:
.for dir in lib/gnu lib/mp4av lib/mp4v2
	@(cd ${WRKSRC}/${dir}; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${ALL_TARGET})
.endfor

do-install:
.for dir in lib/gnu lib/mp4av lib/mp4v2
	@(cd ${WRKSRC}/${dir} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})
.endfor

post-install:
.for i in include/mpeg4ip.h include/mpeg4ip_version.h mpeg4ip_config.h
	${INSTALL_DATA} ${WRKSRC}/${i} ${PREFIX}/include
.endfor

.include <bsd.port.post.mk>
