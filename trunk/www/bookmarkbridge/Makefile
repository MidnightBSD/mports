# New ports collection makefile for:	bookmarkbridge
# Date Created:				January 2004
# Whom:					Marco Molteni <molter@gufi.org>
#
# $MidnightBSD: mports/www/bookmarkbridge/Makefile,v 1.5 2010/05/29 05:58:19 laffer1 Exp $
# $FreeBSD: ports/www/bookmarkbridge/Makefile,v 1.9 2006/02/23 10:39:35 ade Exp $
#

PORTNAME=	bookmarkbridge
PORTVERSION=	0.76
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronize bookmarks between multiple browsers
LICENSE=        gpl2
LIB_DEPENDS=	xml2:${PORTSDIR}/textproc/libxml2

USE_PERL5_BUILD=	yes
USE_XORG=	x11 ice xext
USE_QT_VER=	4
QT_COMPONENTS=	corelib gui moc_build rcc_build uic_build qt3support
USE_GNOME=	gnometarget libxml2
USE_GMAKE=	yes
USE_AUTOTOOLS=	aclocal automake autoconf
ACLOCAL_ARGS=	-I ${LOCALBASE}/share/aclocal

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
QTCFGLIBS+=	${PTHREAD_LIBS}
.endif

.include <bsd.port.post.mk>
