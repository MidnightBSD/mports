PORTNAME=	glslang
DISTVERSION=	8.13.3743
CATEGORIES=	devel graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL and OpenGL ES shader front end and validator

LICENSE=	bsd3
LICENSE_FILE=	${WRKDIR}/LICENSE

USES=		cmake compiler:c++11-lib

USE_GITHUB=	yes
GH_ACCOUNT=	KhronosGroup

post-extract:
	${SED} '/^$$/,$$d' ${WRKSRC}/${PORTNAME}/Include/Types.h \
			>${WRKDIR}/LICENSE

.include <bsd.port.mk>
