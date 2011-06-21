# $MidnightBSD: mports/net/x11vnc/Makefile,v 1.7 2010/08/24 22:22:40 laffer1 Exp $

PORTNAME=	x11vnc
PORTVERSION=	0.9.12
CATEGORIES=	net
MASTER_SITES=	SF/libvncserver/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server for use with real X displays
LICENSE=	gpl2

LIB_DEPENDS=	jpeg:${PORTSDIR}/graphics/jpeg \
		dbus:${PORTSDIR}/devel/dbus \
		xcb:${PORTSDIR}/x11/libxcb \
		pthread-stubs:${PORTSDIR}/devel/libpthread-stubs \
		avahi-common:${PORTSDIR}/net/avahi-app

USE_GNOME=	gnometarget
USE_XORG=	x11 xdamage xfixes xrandr xinerama xext xtst xau xrender xdmcp recordproto

# Sets LDFLAGS and adds to CONFIGURE_ENV, therefore we set LDFLAGS
LDFLAGS+=	-L${LOCALBASE}/lib
USE_OPENSSL=	yes
USE_ICONV=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include"

MAN1=		x11vnc.1
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README README.LibVNCServer TODO

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|include_HEADERS = |noinst_HEADERS = |' \
		-e 's|am__include_HEADERS_DIST|am__noinst_HEADERS_DIST|' \
		-e 's|/include/rfb|/include|' ${WRKSRC}/Makefile.in

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
