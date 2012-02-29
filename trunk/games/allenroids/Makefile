# $MidnightBSD: mports/games/allenroids/Makefile,v 1.2 2009/11/26 22:26:45 laffer1 Exp $
#

PORTNAME=	allenroids
PORTVERSION=	1.1
CATEGORIES=	games
MASTER_SITES=	http://www.integrity.com/homes/tomandkaren/Allenroids/files/Linux/ \
		http://people.midnightbsd.org/~laffer1/
DISTFILES=	AllenroidsRyan.tgz
WRKSRC=		${WRKDIR}/Allenroids

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Asteroids clone by Allen Smith
LICENSE=	other

USE_GMAKE=	yes
USE_SDL=	sound
USE_GL=		glut glu gl

.include <bsd.port.mk>
