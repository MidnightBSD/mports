PORTNAME=	Imath
PORTVERSION=	3.1.9
DISTVERSIONPREFIX=	v
PORTREVISION=	0
CATEGORIES=	math devel graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++/Python lib of 2D/3D vector, matrix, math ops for computer graphics
WWW=		https://github.com/AcademySoftwareFoundation/Imath/

LICENSE=	bsd3

USES=		cmake compiler:c++14-lang pathfix pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	AcademySoftwareFoundation
USE_LDCONFIG=	yes

CMAKE_ARGS+=	-DCMAKE_DEBUG_POSTFIX= \
		-DCMAKE_INSTALL_PREFIX=${PREFIX}

NO_TEST=	yes

PATCH_STRIP=	-p1

PLIST_SUB=	MAJORVER=${_MAJORVER} \
		MINVER=${_MINVER} \
		PLVER=${_PLVER} \
		VER=${_VER} \
		PYVER=${PYTHON_VER:S/./_/}
PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS LARGE_STACK PYTHON
OPTIONS_SUB=	yes

LARGE_STACK_DESC=	Enable sys-dependent large stack optimizations
LARGE_STACK_CMAKE_BOOL=	IMATH_ENABLE_LARGE_STACK

PYTHON_BUILD_DEPENDS=	${PYNUMPY}
PYTHON_LIB_DEPENDS=	${PY_BOOST}
PYTHON_RUN_DEPENDS=	${PYNUMPY}
PYTHON_USES=		python
PYTHON_CMAKE_BOOL=	PYTHON

_MAJORVER=	3_1
_VER=		29
_MINVER=	8
_PLVER=		0

post-patch:
	${REINPLACE_CMD} -E 's}find_package\(Python(3?) COMPONENTS}set(Python\1_EXECUTABLE ${PYTHON_CMD})\nfind_package(Python\1 ${PYTHON_VER} EXACT COMPONENTS}' \
		${WRKSRC}/src/python/CMakeLists.txt

post-install:
.for l in libImath
	${STRIP_CMD} ${PREFIX}/lib/${l}-${_MAJORVER}.so
.endfor

	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

#do-test:
#	cd ${BUILD_WRKSRC} && ctest -j ${MAKE_JOBS_NUMBER}

.include <bsd.port.mk>
