# New ports collection makefile for:   gtkmm2
# Date created:        30 September 2002
# Whom:                Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
#
# $MidnightBSD: mports/x11-toolkits/gtkmm20/Makefile,v 1.3 2007/08/29 06:11:21 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/gtkmm20/Makefile,v 1.80 2006/05/31 22:18:49 mezz Exp $
#

PORTNAME=	gtkmm
PKGNAMESUFFIX=	20
PORTVERSION=	2.2.12
PORTREVISION?=	8
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME} \
		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/2.2 \
		gtkmm
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Gtk+, Pango, Atk, and Glib
LICENSE=	lgpl

USE_BZIP2=	yes
LATEST_LINK=	gtkmm2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	sigc-1.2.5:${PORTSDIR}/devel/libsigc++12
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=        libtool:15
USE_GMAKE=	yes
USE_XLIB=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack lthack gtk20
CONFIGURE_ARGS=	--enable-static=yes \
		--with-sigc-prefix=${LOCALBASE}

post-patch:
.for d in docs examples tests
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/${d}//' ${WRKSRC}/Makefile.in
.endfor

.include <bsd.port.mk>

.endif
