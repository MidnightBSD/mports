# $MidnightBSD$
# $FreeBSD: ports/misc/unclutter/Makefile,v 1.13 2006/08/21 11:28:14 miwi Exp $

PORTNAME=	unclutter
PORTVERSION=	8
PORTREVISION=	3
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_XCONTRIB}
MASTER_SITE_SUBDIR=	utilities

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Remove idle cursor image from screen

LICENSE=        publicdom

WRKSRC=		$(WRKDIR)/unclutter
USES=		imake tar:Z
USE_XORG=	x11 xext
PLIST_FILES=	bin/unclutter \
		man/man1/unclutter.1.gz

.include <bsd.port.mk>
