PORTNAME=	capstone
DISTVERSION=	5.0.6
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python # Conflicts with devel/capstone distfile

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the Capstone Disassembly Engine
WWW=		https://www.capstone-engine.org

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

LIB_DEPENDS=	libcapstone.so:devel/capstone

USES=		cpe python
CPE_VENDOR=	${PORTNAME}-engine
USE_PYTHON=	autoplist distutils
MAKE_ENV+=	LIBCAPSTONE_PATH= # Prevent bundled libcapstone from being built

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/capstone/__init__.py

.include <bsd.port.mk>
