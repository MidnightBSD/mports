# $MidnightBSD: mports/net/libvncserver/Makefile,v 1.2 2009/09/20 03:41:10 laffer1 Exp $

PORTNAME=	libvncserver
PORTVERSION=	0.9.7
CATEGORIES=	net devel
MASTER_SITES=	SF
DISTNAME=	LibVNCServer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide an easy API to write one's own vnc server
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg

USE_GNOME=	gnometarget
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--without-x

post-patch:
	@${REINPLACE_CMD} -e \
		's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|x11vnc||g' ${WRKSRC}/Makefile.in

post-install:
	${INSTALL_DATA} ${WRKSRC}/rfb/default8x16.h ${PREFIX}/include/rfb

.include <bsd.port.mk>
