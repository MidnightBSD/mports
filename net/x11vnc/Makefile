# $MidnightBSD: mports/net/x11vnc/Makefile,v 1.3 2009/06/27 23:33:40 laffer1 Exp $

PORTNAME=	x11vnc
PORTVERSION=	0.9.6
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=libvncserver

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server for use with real X displays
LICENSE=	gpl2

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		dbus:${PORTSDIR}/devel/dbus \
		avahi-common.3:${PORTSDIR}/net/avahi-app

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

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
