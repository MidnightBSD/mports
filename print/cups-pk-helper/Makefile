# Created by: Michael Johnson <ahze@FreeBSD.org>
#   $MCom: ports/print/cups-pk-helper/Makefile,v 1.1 2009/12/29 16:01:07 ahze Exp $


PORTNAME=	cups-pk-helper
PORTVERSION=	0.2.7
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	https://www.freedesktop.org/software/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helper that makes system-config-printer use polkit
WWW=		https://www.freedesktop.org/software/cups-pk-helper

LICENSE=	gpl2+

LIB_DEPENDS=	libcups.so:print/cups \
		libpolkit-gobject-1.so:sysutils/polkit

USE_GNOME=	glib20 intltool
USES=		cpe gettext gnome localbase meson pkgconfig tar:xz
CPE_VENDOR=	cups-pk-helper_project

.include <bsd.port.mk>
