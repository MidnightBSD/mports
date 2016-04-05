# Created by: Jesse van den Kieboom <troplosti@orcaweb.cjb.net>
# $FreeBSD: head/sysutils/gksu/Makefile 390408 2015-06-23 14:12:34Z amdmi3 $
# $MidnightBSD$

PORTNAME=	gksu
PORTVERSION=	2.0.2
CATEGORIES=	sysutils
MASTER_SITES=	http://people.debian.org/~kov/gksu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical frontend to su
LICENSE=	gpl2

LIB_DEPENDS=	libgksu2.so:${PORTSDIR}/sysutils/libgksu \
		libnautilus-extension.so:${PORTSDIR}/x11-fm/nautilus \
		libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring

USES=		gettext-tools gmake libtool pathfix pkgconfig
USE_GNOME=	gconf2 gnomeprefix gtk20 intlhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e 's|glib/gkeyfile.h|glib.h|g' \
		${WRKSRC}/nautilus-gksu/libnautilus-gksu.c

.include <bsd.port.mk>
