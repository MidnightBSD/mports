# Created by: Michael Johnson <ahze@FreeBSD.org>
# $FreeBSD: head/print/cups-pk-helper/Makefile 410825 2016-03-11 11:53:42Z tijl $
#   $MCom: ports/print/cups-pk-helper/Makefile,v 1.1 2009/12/29 16:01:07 ahze Exp $
# $MidnightBSD$

PORTNAME=	cups-pk-helper
PORTVERSION=	0.2.5
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	http://www.freedesktop.org/software/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helper that makes system-config-printer use PolicyKit

LICENSE=	unknown

LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups \
		libpolkit-gobject-1.so:${PORTSDIR}/sysutils/polkit

USE_GNOME=	glib20 intltool
USES=		cpe gettext gmake pkgconfig tar:xz
CPE_VENDOR=	cups-pk-helper_project
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
