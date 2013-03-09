# New ports collection makefile for:	telepathy-glib
# Date created:				Apr 19 2007
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD: mports/net-im/telepathy-glib/Makefile,v 1.4 2011/02/02 21:16:29 laffer1 Exp $
# $FreeBSD: ports/net-im/telepathy-glib/Makefile,v 1.11 2008/07/06 21:57:45 marcus Exp $

PORTNAME=	telepathy-glib
PORTVERSION=	0.12.7
PORTREVISION=	0
CATEGORIES=	net-im
MASTER_SITES=	http://telepathy.freedesktop.org/releases/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib utility library for the Telepathy framework
LICENSE=	lgpl

LIB_PC_DEPENDS=	gobject-2.0.pc:${PORTSDIR}/devel/glib20 \
		dbus-glib-1.pc:${PORTSDIR}/devel/dbus-glib

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt \
		vapigen:${PORTSDIR}/lang/vala-vapigen \
		g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

BUILD_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}
RUN_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g} \
		vapigen:${PORTSDIR}/lang/vala-vapigen

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig glib20 ltverhack
USE_PYTHON_BUILD=	yes
MAKE_JOBS_UNSAFE=	yes
CONFIGURE_ARGS=	--enable-vala-bindings

post-patch:
	@${REINPLACE_CMD} -e 's|\(^pkgconfigdir =\).*|\1 ${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/telepathy-glib/Makefile.in
	@${REINPLACE_CMD} -e 's|datarootdir)/vala/vapi|datarootdir)/vala-0.12/vapi|g' \
		${WRKSRC}/vala/Makefile.in

.include <bsd.port.mk>
