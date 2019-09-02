PORTNAME=	x11vnc
PORTVERSION=	0.9.16
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC server for use with real X displays

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:devel/libpthread-stubs
LIB_DEPENDS=	libvncserver.so:net/libvncserver

USE_XORG=	x11 xcb xdamage xfixes xrandr xinerama xext xtst xau xrender \
		xdmcp xi xorgproto
# Sets LDFLAGS and adds to CONFIGURE_ENV, therefore we set LDFLAGS
LDFLAGS+=	-L${LOCALBASE}/lib
USES=		iconv pkgconfig jpeg ssl gmake autoreconf
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ssl=${OPENSSLBASE}
CPPFLAGS+=	-I${LOCALBASE}/include
USE_GITHUB=	yes
GH_ACCOUNT=	LibVNC
#DEFAULT_VERSIONS=	ssl=openssl

PORTDOCS=	AUTHORS ChangeLog NEWS README

OPTIONS_DEFINE=	NLS AVAHI DOCS
OPTIONS_DEFAULT=AVAHI
NO_OPTIONS_SORT=yes
NLS_USES=	gettext
AVAHI_LIB_DEPENDS=	libavahi-common.so:net/avahi-app
AVAHI_CONFIGURE_OFF=	--without-avahi

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
