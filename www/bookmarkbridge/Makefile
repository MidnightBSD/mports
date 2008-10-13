# New ports collection makefile for:	bookmarkbridge
# Date Created:				January 2004
# Whom:					Marco Molteni <molter@gufi.org>
#
# $MidnightBSD: mports/www/bookmarkbridge/Makefile,v 1.3 2008/02/15 01:55:56 laffer1 Exp $
# $FreeBSD: ports/www/bookmarkbridge/Makefile,v 1.9 2006/02/23 10:39:35 ade Exp $
#

PORTNAME=	bookmarkbridge
PORTVERSION=	0.72
PORTREVISION=   2
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	bookmarkbridge

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronize bookmarks between multiple browsers
LICENSE=        gpl2
LIB_DEPENDS=	xml2:${PORTSDIR}/textproc/libxml2

USE_QT_VER=	3
USE_XLIB=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-mt --program-prefix="" \
		--with-libxml2-include="${LOCALBASE}/include/libxml2"

.include <bsd.port.mk>
