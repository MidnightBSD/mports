# New ports collection makefile for:   gio-fam-backend
# Date Created:			22 December 2007
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/devel/gio-fam-backend/Makefile,v 1.4 2009/04/12 18:24:25 laffer1 Exp $
# $FreeBSD: ports/devel/gio-fam-backend/Makefile,v 1.3 2008/04/08 11:37:41 ahze Exp $
#   $MCom: ports/devel/gio-fam-backend/Makefile,v 1.9 2008/03/12 17:46:37 marcus Exp $
#

PORTNAME=	gio-fam-backend
PORTVERSION=	2.20.5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME:S,%SUBDIR%,sources/glib/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/},} \
		ftp://ftp.gtk.org/pub/glib/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}/ \
		ftp://ftp.gimp.org/pub/%SUBDIR%/ \
		ftp://ftp.cs.umn.edu/pub/gimp/%SUBDIR%/ \
		http://www.ameth.org/gimp/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/gimp/%SUBDIR%,}
MASTER_SITE_SUBDIR=	gtk/v${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	glib-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FAM backend for GLib's GIO library
LICENSE=	lgpl

LIB_DEPENDS+=	glib-2.0.0:${PORTSDIR}/devel/glib20

USE_BZIP2=	yes
BUILD_WRKSRC=	${WRKSRC}/gio/fam
INSTALL_WRKSRC=	${BUILD_WRKSRC}
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
USE_FAM=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--enable-static --with-libiconv=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -lintl" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

.include <bsd.port.mk>
