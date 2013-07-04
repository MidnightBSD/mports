# $MidnightBSD: mports/net/glib-networking/Makefile,v 1.4 2013/03/03 16:39:05 laffer1 Exp $
# $FreeBSD: ports/net/glib-networking/Makefile,v 1.1 2011/08/23 18:15:49 kwm Exp $

PORTNAME=	glib-networking
PORTVERSION=	2.34.2
CATEGORIES=	net
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network-related giomodules for glib
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas
LIB_DEPENDS=	gnutls:${PORTSDIR}/security/gnutls \
		gcrypt:${PORTSDIR}/security/libgcrypt \
		dbus-1:${PORTSDIR}/devel/dbus \
		proxy:${PORTSDIR}/net/libproxy
RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas

USE_XZ=		yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack glib20 intltool
USE_GETTEXT=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
CONFIGURE_ARGS=	--with-ca-certificates=${LOCALBASE}/share/certs/ca-root-nss.crt
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e' s|-Wmissing-include-dirs||g' ${WRKSRC}/configure

.include <bsd.port.mk>
