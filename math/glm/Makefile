# Created by: demon@FreeBSD.org

PORTNAME=	glm
PORTVERSION=	0.9.8.5
PORTEPOCH=	1
CATEGORIES=	math graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ mathematics library for software based on the OpenGL GLSL

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/copying.txt

USES=		cmake compiler:c++11-lang pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	g-truc

NO_ARCH=	yes

OPTIONS_DEFINE=	TEST
TEST_CMAKE_BOOL=	GLM_TEST_ENABLE
TEST_TEST_TARGET=	test

.include <bsd.port.mk>
