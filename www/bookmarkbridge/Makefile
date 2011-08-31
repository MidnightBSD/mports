# New ports collection makefile for:	bookmarkbridge
#
# $MidnightBSD: mports/www/bookmarkbridge/Makefile,v 1.6 2011/02/02 21:31:38 laffer1 Exp $
# $FreeBSD: ports/www/bookmarkbridge/Makefile,v 1.9 2006/02/23 10:39:35 ade Exp $
#

PORTNAME=	bookmarkbridge
PORTVERSION=	0.76
PORTREVISION=	3
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
USE_GNOME=	libxml2
USE_GMAKE=	yes
USE_AUTOTOOLS=	aclocal automake autoconf
ACLOCAL_ARGS=	-I ${LOCALBASE}/share/aclocal

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
QTCFGLIBS+=	${PTHREAD_LIBS}
.endif

.include <bsd.port.post.mk>
