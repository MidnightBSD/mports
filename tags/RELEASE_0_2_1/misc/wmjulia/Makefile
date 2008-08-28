# New ports collection makefile for:	wmjulia
# Date created:				16 May 2002
# Whom:					Alexey Dokuchaev <danfe@regency.nsu.ru>
#
# $MidnightBSD: mports/misc/wmjulia/Makefile,v 1.1 2007/03/09 05:05:41 laffer1 Exp $
# $FreeBSD: ports/misc/wmjulia/Makefile,v 1.6 2004/02/05 20:37:36 trevor Exp $
#

PORTNAME=	wmjulia
PORTVERSION=	0.40
PORTREVISION=	2
CATEGORIES=	misc windowmaker afterstep
MASTER_SITES=	http://web.novalis.org/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dockapp that creates an animated Julia set

PLIST_FILES=	bin/wmjulia
WRKSRC=	${WRKDIR}/${PORTNAME}.app/${PORTNAME}
USE_GMAKE=	yes
USE_XPM=	yes
USE_XLIB=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
