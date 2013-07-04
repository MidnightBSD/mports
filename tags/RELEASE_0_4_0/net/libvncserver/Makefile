# $MidnightBSD: mports/net/libvncserver/Makefile,v 1.3 2010/03/25 01:33:14 laffer1 Exp $

PORTNAME=	libvncserver
PORTVERSION=	0.9.7
CATEGORIES=	net devel
MASTER_SITES=	SF
DISTNAME=	LibVNCServer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide an easy API to write one's own vnc server
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg

USE_GNOME=	
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
