PORTNAME=	wmjulia
PORTVERSION=	0.40
PORTREVISION=	5
CATEGORIES=	misc windowmaker afterstep
MASTER_SITES=	http://web.novalis.org/programs/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockapp that creates an animated Julia set

LICENSE=        gpl2

PLIST_FILES=	bin/wmjulia
WRKSRC=		${WRKDIR}/${PORTNAME}.app
USES=		gmake xorg
USE_XORG=	xpm xext

MAKE_ARGS=	-C ${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
