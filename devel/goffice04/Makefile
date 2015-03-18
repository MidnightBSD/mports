# $MidnightBSD$
# $FreeBSD: ports/devel/goffice04/Makefile,v 1.23 2008/06/06 13:21:16 edwin Exp $
#   $MCom: ports/devel/goffice/Makefile,v 1.32 2007/09/06 05:01:28 marcus Exp $
#
# !!! When updating goffice, don't forget to update science/gchempaint pkg-plists too! !!!

PORTNAME=	goffice
PORTVERSION=	0.4.3
PORTREVISION=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	04
DISTFILES=	goffice-${PORTVERSION}.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities

LICENSE=	gpl2

LIB_DEPENDS=	libpcre.so:${PORTSDIR}/devel/pcre

USES=		gettext gmake tar:bzip2 libtool
USE_GNOME=	libgnomeprint libglade2 libgnomeui libgsf
USE_LDCONFIG=	yes
CPPFLAGS="-I${LOCALBASE}/include"
LDFLAGS="-L${LOCALBASE}/lib"

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
