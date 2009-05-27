# New ports collection makefile for:	wmfirew
# Date created:				16 May 2002
# Whom:					Alexey Dokuchaev <danfe@regency.nsu.ru>
#
# $MidnightBSD: mports/misc/wmfirew/Makefile,v 1.2 2007/03/22 04:38:39 ctriv Exp $
# $FreeBSD: ports/misc/wmfirew/Makefile,v 1.6 2004/02/05 20:37:36 trevor Exp $
#

PORTNAME=	wmfirew
PORTVERSION=	0.20
PORTREVISION=	2
CATEGORIES=	misc windowmaker afterstep
MASTER_SITES=	http://web.novalis.org/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dockapp that shows fireworks in action
LICENSE=        gpl2
PLIST_FILES=	bin/wmfirew
WRKSRC=	${WRKDIR}/${PORTNAME}.app/${PORTNAME}
USE_GMAKE=	yes
USE_XPM=	yes
USE_XLIB=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
