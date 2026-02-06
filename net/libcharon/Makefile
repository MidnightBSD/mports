PORTNAME=	libCharon
DISTVERSION=	5.0.0
CATEGORIES=	net devel cad
DIST_SUBDIR=	Ultimaker

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File metadata and streaming library
WWW=		https://github.com/Ultimaker/libCharon

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake python
STRIP=

USE_GITHUB=	yes
GH_ACCOUNT=	Ultimaker

CMAKE_ARGS+=	-DPYTHON_EXECUTABLE:STRING=${PYTHON_CMD} \
		-DPython_VERSION:STRING=${PYTHON_VER} \
		-DPYTHONPREFIX_SITELIBDIR:STRING=${PYTHONPREFIX_SITELIBDIR} \
		-DINSTALL_SERVICE:BOOL=OFF
NO_ARCH=	yes

.include <bsd.port.mk>
