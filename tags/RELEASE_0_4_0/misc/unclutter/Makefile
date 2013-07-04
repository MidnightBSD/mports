# $MidnightBSD: mports/misc/unclutter/Makefile,v 1.3 2009/06/09 20:35:04 crash Exp $
# $FreeBSD: ports/misc/unclutter/Makefile,v 1.13 2006/08/21 11:28:14 miwi Exp $

PORTNAME=	unclutter
PORTVERSION=	8
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_XCONTRIB}
MASTER_SITE_SUBDIR=	utilities
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Remove idle cursor image from screen
LICENSE=        publicdom
WRKSRC=		$(WRKDIR)/unclutter
USE_IMAKE=	yes
USE_XORG=	x11 xext
MAN1=		unclutter.1
PLIST_FILES=	bin/unclutter

.include <bsd.port.mk>
