# New ports collection makefile for:    xine
# Date created:         14 Oct 2000
# Whom:                 alex
#
# $FreeBSD: ports/multimedia/xine/Makefile,v 1.69 2006/12/07 17:17:44 nobutaka Exp $
# $MidnightBSD: mports/multimedia/xine/Makefile,v 1.5 2007/04/10 17:51:07 laffer1 Exp $
#

PORTNAME=	xine
PORTVERSION=	0.99.4
PORTREVISION=	10
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	${PORTNAME}-ui-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An X11 multimedia player

LIB_DEPENDS=	xine.1:${PORTSDIR}/multimedia/libxine \
		png.5:${PORTSDIR}/graphics/png \
		curl.4:${PORTSDIR}/ftp/curl

USE_GETTEXT=	yes
USE_XLIB=	yes
USE_X_PREFIX=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		THREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		THREAD_LIBS="${PTHREAD_LIBS}"
CONFIGURE_ARGS=	--program-transform-name="" --build=${ARCH}-portbld-freebsd6.0

MANLANG=	"" de es fr pl
MAN1=		aaxine.1 xine-bugreport.1 xine-check.1 xine-remote.1 xine.1

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
USE_GCC= 4.1+
.endif

.if ${ARCH} == "i386"
.if !defined(WITHOUT_WIN32_CODECS)
RUN_DEPENDS=	${CODEC_DETECTION_FILE}:${CODEC_PORT}

CODEC_PORT=	${PORTSDIR}/multimedia/win32-codecs
CODEC_DETECTION_FILE!=	${MAKE} -f ${CODEC_PORT}/Makefile -V CODEC_DETECTION_FILE
.endif
.endif

.if !defined(WITHOUT_XFT)
LIB_DEPENDS+=	Xft.2:${PORTSDIR}/x11-fonts/libXft
.else
CONFIGURE_ARGS+=	--disable-xft
.endif

.if !defined(WITHOUT_CACA) && (exists(${LOCALBASE}/lib/libcaca.a) || defined(WITH_CACA))
PLIST_SUB+=	WITH_CACA=""
.else
PLIST_SUB+=	WITH_CACA="@comment "
CONFIGURE_ARGS+=	--without-libcaca --disable-cacatest
.endif

.if !defined(WITHOUT_AALIB) && (exists(${LOCALBASE}/lib/libaa.so.1) || defined (WITH_AALIB))
LIB_DEPENDS+=	aa.1:${PORTSDIR}/graphics/aalib
PLIST_SUB+=	WITH_AALIB=""
.else
PLIST_SUB+=	WITH_AALIB="@comment "
CONFIGURE_ARGS+=	--without-aalib --disable-aalibtest
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|THREAD_LIBS=.*$$|THREAD_LIBS="\$$THREAD_LIBS"|g ; \
		 s|THREAD_CFLAGS=.*$$|THREAD_CFLAGS="\$$THREAD_CFLAGS"|g ; \
		 s|-L/usr/local/lib||g ; \
		 s|-I/usr/local/include||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		 's|-malign-loops|-falign-loops|g ; \
		  s|-malign-jumps|-falign-jumps|g ; \
		  s|-malign-functions|-falign-functions|g' ${WRKSRC}/configure
	@${RM} ${WRKSRC}/src/xitk/xine-remote.c

post-install:
.for l in es fr
	@${CP} ${PREFIX}/man/man1/aaxine.1 ${PREFIX}/man/${l}/man1/aaxine.1
.endfor
.for l in es fr pl
	@${CP} ${PREFIX}/man/man1/xine-bugreport.1 ${PREFIX}/man/${l}/man1/xine-bugreport.1
.endfor
.for l in es fr pl
	@${CP} ${PREFIX}/man/man1/xine-check.1 ${PREFIX}/man/${l}/man1/xine-check.1
.endfor
.for l in es fr
	@${CP} ${PREFIX}/man/man1/xine-remote.1 ${PREFIX}/man/${l}/man1/xine-remote.1
.endfor
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
