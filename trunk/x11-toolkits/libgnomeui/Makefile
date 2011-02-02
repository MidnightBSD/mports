# $MidnightBSD: mports/x11-toolkits/libgnomeui/Makefile,v 1.7 2010/08/14 02:57:57 laffer1 Exp $

PORTNAME=	libgnomeui
PORTVERSION=	2.24.3
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for the GNOME GUI, a GNU desktop environment
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS+=	gnome-keyring.0:${PORTSDIR}/security/gnome-keyring \
		startup-notification-1.0:${PORTSDIR}/x11/startup-notification
RUN_DEPENDS=	${LOCALBASE}/share/icons/gnome/index.theme:${PORTSDIR}/misc/gnome-icon-theme

USE_GETTEXT=	yes
USE_XORG=	sm xpm
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack gnomehier libbonoboui ltverhack \
		referencehack gvfs
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_BISON=	build
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.include <bsd.port.mk>

.endif
