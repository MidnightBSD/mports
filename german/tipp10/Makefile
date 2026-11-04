PORTNAME=	tipp10
DISTVERSIONPREFIX=	v
DISTVERSION=	3.3.3
CATEGORIES=	german education

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	10-finger touch typing learning program
WWW=		https://www.tipp10.com/ \
		https://gitlab.com/tipp10/tipp10/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake gl qt:6 sqlite
USE_GITLAB=	yes
USE_GL=		gl opengl
USE_QT=		base multimedia sqldriver-sqlite:run tools:build

.include <bsd.port.mk>
