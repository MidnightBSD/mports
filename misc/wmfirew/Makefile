# $MidnightBSD: mports/misc/wmfirew/Makefile,v 1.4 2010/12/11 18:54:40 laffer1 Exp $

PORTNAME=	wmfirew
PORTVERSION=	0.20
PORTREVISION=	4
CATEGORIES=	misc windowmaker afterstep
MASTER_SITES=	http://web.novalis.org/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A dockapp that shows fireworks in action

LICENSE=        gpl2

PLIST_FILES=	bin/wmfirew
WRKSRC=	${WRKDIR}/${PORTNAME}.app/${PORTNAME}
USE_GMAKE=	yes
USE_XORG=	xpm

post-patch:
	@${REINPLACE_CMD} -e \
	    's|^void main|int main|' ${WRKSRC}/wmfirew.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
