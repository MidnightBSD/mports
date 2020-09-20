PORTNAME=	graphite2
PORTVERSION=	1.3.14
CATEGORIES=	graphics print

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rendering capabilities for complex non-Roman writing systems

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	dual

USES=		cmake compiler:c++11-lib
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	silnrsi
GH_PROJECT=	graphite

post-patch:
	@${REINPLACE_CMD} -e 's|/pkgconfig|data&|' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
