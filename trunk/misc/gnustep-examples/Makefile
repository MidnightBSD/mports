# $MidnightBSD$

PORTNAME=	gnustep-examples
PORTVERSION=	1.4.0
PORTREVISION=	1
CATEGORIES=	misc gnustep
MASTER_SITES=	GNUSTEP/usr-apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep example applications

LICENSE=	gpl3

USES=		gnustep
USE_GNUSTEP=	back build
USE_GL=		yes

WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GNUSTEP_MAKE_DIRS+=	gui/Finger gui/GFractal gui/HostAddress gui/MyGL \
			gui/Calculator gui/Ink gui/GSTest

post-patch:
	${REINPLACE_CMD} -e 's|^//|#|' \
		${WRKSRC}/gui/GFractal/GNUmakefile

.include <bsd.port.mk>
