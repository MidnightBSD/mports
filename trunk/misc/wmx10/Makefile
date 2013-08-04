# $MidnightBSD: mports/misc/wmx10/Makefile,v 1.4 2010/12/11 18:58:48 laffer1 Exp $

PORTNAME=	wmx10
PORTVERSION=	0.03
PORTREVISION=	3
CATEGORIES=	misc windowmaker
MASTER_SITES=	http://www.cs.uml.edu/~jhawkins/wmx10/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Remote control for X10 devices

LICENSE=        gpl2

BROKEN=		not building

WRKSRC=		${WRKDIR}/wmx10.app/wmx10

USE_GMAKE=	yes
USE_XORG=	xpm x11 ice

PLIST_FILES=	bin/wmx10

.include <bsd.port.mk>
