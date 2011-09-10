# $MidnightBSD$
# $FreeBSD: ports/net/glib-networking/Makefile,v 1.1 2011/08/23 18:15:49 kwm Exp $

PORTNAME=	glib-networking
PORTVERSION=	2.28.7
PORTREVISION=	0
CATEGORIES=	net
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Network-related giomodules for glib
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas
LIB_DEPENDS=	gnutls.47:${PORTSDIR}/security/gnutls \
		gcrypt.18:${PORTSDIR}/security/libgcrypt \
		dbus-1.3:${PORTSDIR}/devel/dbus \
		proxy.1:${PORTSDIR}/net/libproxy
RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack pkgconfig glib20 intltool
USE_GETTEXT=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
CONFIGURE_ARGS=	--with-ca-certificates=${LOCALBASE}/share/certs/ca-root-nss.crt
CPPFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ENV=	LDFLAGS="-L${LOCALBASE}/lib" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

post-patch:
	@${REINPLACE_CMD} -e' s|-Wmissing-include-dirs||g' ${WRKSRC}/configure

.include <bsd.port.mk>
