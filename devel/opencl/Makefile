# Created by: Oliver Hartmann <ohartman@zedat.fu-berlin.de>

PORTNAME=	opencl
PORTVERSION=	3.0.8
CATEGORIES=	devel

MAINTAINER=	poprts@MidnightBSD.org
COMMENT=	Open Computing Language (OpenCL) specifications V3.0 (header files)

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	KhronosGroup
GH_PROJECT=	OpenCL-Headers OpenCL-CLHPP:clhpp
GH_TAGNAME=	${HEADER_TAG} ${CLHPP_TAG}:clhpp

# the header releases don't have tags yet, so use git commit for now
HEADER_TAG=	v2021.06.30
CLHPP_TAG=	v2.0.15	#  include missing CL/opencl.hpp

NO_BUILD=	yes
NO_ARCH=	yes

WRKSRC_SUBDIR=	CL

do-install:
	@${MKDIR} ${PREFIX}/include/CL
	${INSTALL_DATA} ${WRKSRC}/*.h ${PREFIX}/include/CL
	${INSTALL_DATA} ${WRKSRC_clhpp}/include/CL/*.hpp \
		${PREFIX}/include/CL

.include <bsd.port.mk>
