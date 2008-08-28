# New ports collection makefile for:   gtkmm2
# Date created:        30 September 2002
# Whom:                Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
#
# $MidnightBSD: mports/x11-toolkits/gtkmm24/Makefile,v 1.5 2008/03/26 01:17:43 ctriv Exp $
# $FreeBSD: ports/x11-toolkits/gtkmm24/Makefile,v 1.102 2006/05/31 22:18:49 mezz Exp $
#   $MCom: ports/x11-toolkits/gtkmm24/Makefile,v 1.8 2005/10/20 16:16:50 marcus Exp $
#

PORTNAME=	gtkmm
PKGNAMESUFFIX=	24
PORTVERSION=	2.12.7
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Gtk+, Pango, Atk
LICENSE=	lgpl

USE_BZIP2=	yes
LATEST_LINK=	gtkmm24

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	glibmm-2.4.1:${PORTSDIR}/devel/glibmm \
		cairomm-1.0.1:${PORTSDIR}/graphics/cairomm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
USE_GCC=	3.4+
USE_XLIB=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack gtk20
CONFIGURE_ARGS=	--disable-demos \
		--disable-docs \
		--disable-examples \
		--enable-static=yes \
		--with-sigc-prefix=${LOCALBASE}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/tests//' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|demo[$$][(]EXEEXT[)]|gtkmm-demo$$(EXEEXT)|g' \
		${WRKSRC}/demos/gtk-demo/Makefile.in

.include <bsd.port.mk>

.endif
