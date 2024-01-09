PORTNAME=	image-editing
PORTVERSION=	1.1
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image editing metaport

LICENSE=	bsd2

USES=		metaport magick:x11

RUN_DEPENDS=	inkscape>0:graphics/inkscape \
		gimp>0:graphics/gimp \
		geeqie>0:graphics/geeqie \
		graphviz>0:graphics/graphviz

do-install:
	${MKDIR} ${PREFIX}/share/image-editing/
	${TOUCH} ${PREFIX}/share/image-editing/.install

.include <bsd.port.mk>
