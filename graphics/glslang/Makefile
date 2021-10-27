PORTNAME=	glslang
DISTVERSION=	11.6.0
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL and OpenGL ES shader front end and validator

LICENSE=	apache2 bsd2 bsd3 gpl3 mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake:testing compiler:c++11-lib python:3.4+,build
USE_GITHUB=	yes
GH_ACCOUNT=	KhronosGroup

# magus
NO_TEST=	yes

.include <bsd.port.mk>
