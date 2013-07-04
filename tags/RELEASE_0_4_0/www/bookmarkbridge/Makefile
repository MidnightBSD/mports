# New ports collection makefile for:	bookmarkbridge
#
# $MidnightBSD: mports/www/bookmarkbridge/Makefile,v 1.7 2011/08/31 03:29:40 laffer1 Exp $
# $FreeBSD: ports/www/bookmarkbridge/Makefile,v 1.9 2006/02/23 10:39:35 ade Exp $
#

PORTNAME=	bookmarkbridge
PORTVERSION=	0.76
PORTREVISION=	4
CATEGORIES=	www
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronize bookmarks between multiple browsers
LICENSE=        gpl2
LIB_DEPENDS=	xml2:${PORTSDIR}/textproc/libxml2

USE_PERL5_BUILD=	yes
USE_XORG=	x11 ice xext
USE_QT4=	corelib gui moc_build rcc_build uic_build qt3support
USE_GNOME=	libxml2
USE_GMAKE=	yes
USES=		pkgconfig
USE_AUTOTOOLS=	aclocal automake autoconf
ACLOCAL_ARGS=	-I ${LOCALBASE}/share/aclocal

.include <bsd.port.mk>
