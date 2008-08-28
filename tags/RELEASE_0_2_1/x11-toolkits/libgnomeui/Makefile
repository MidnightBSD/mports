# New ports collection makefile for:	libgnomeui
# Date created:				07 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreBSD.org>
#
# $MidnightBSD: mports/x11-toolkits/libgnomeui/Makefile,v 1.3 2008/05/31 22:55:04 crash Exp $
# $FreeBSD: ports/x11-toolkits/libgnomeui/Makefile,v 1.53 2007/05/19 20:31:18 flz Exp $
#    $MCom: ports/x11-toolkits/libgnomeui/Makefile,v 1.99 2007/03/14 03:42:53 marcus Exp $
#

PORTNAME=	libgnomeui
PORTVERSION=	2.22.1
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
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
USE_AUTOTOOLS=	libtool:15
USE_BISON=	build
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.include <bsd.port.mk>

.endif
