# $MidnightBSD$
# $FreeBSD: ports/www/bookmarkbridge/Makefile,v 1.9 2006/02/23 10:39:35 ade Exp $

PORTNAME=	bookmarkbridge
PORTVERSION=	0.76
PORTREVISION=	6
CATEGORIES=	www
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronize bookmarks between multiple browsers

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf gmake perl5 pkgconfig shebangfix
SHEBANG_FILES=	bookmarkbridge/docs/autodocs.pl
USE_XORG=	x11 ice xext
USE_QT4=	corelib gui qt3support moc_build rcc_build uic_build
USE_GNOME=	libxml2
GNU_CONFIGURE=	yes

DESKTOP_ENTRIES="BookmarkBridge" "" "" "${PORTNAME}" "Qt;Network;" "false"

.include <bsd.port.mk>
