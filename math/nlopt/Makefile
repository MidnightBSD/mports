PORTNAME=	nlopt
DISTVERSIONPREFIX=	v
DISTVERSION=	2.10.0
PORTREVISION=	1
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nonlinear optimization library
WWW=		https://nlopt.readthedocs.io/ \
		https://github.com/stevengj/nlopt/

LICENSE=	lgpl2.1 mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

FLAVORS=	full minimal
FLAVOR?=	${FLAVORS:[1]}

full_BUILD_DEPENDS=		${PYNUMPY} \
				swig:devel/swig
full_LIB_DEPENDS=		liboctave.so:math/octave
full_RUN_DEPENDS=		${PYNUMPY}
full_CONFLICTS_INSTALL=		${PORTNAME}-minimal
minimal_PKGNAMESUFFIX=		-minimal
minimal_CONFLICTS_INSTALL=	${PORTNAME}

USES=		cmake:testing
USE_GITHUB=	yes
GH_ACCOUNT=	stevengj
USE_LDCONFIG=	yes

# 'make test': 100% tests passed, 0 tests failed out of 83
CMAKE_TESTING_ON=	NLOPT_TESTS

.if ${FLAVOR} == full
USES+=		guile:3.0,alias localbase octave:env pkgconfig python
# Because guile-config-3.0 crashes, nlopt avoids this by using
# files/patch-cmake_FindGuile.cmake and setting GUILE_EXECUTABLE
# and GUILE_CONFIG_EXECUTABLE
MAKE_ENV+=	GUILE_EXECUTABLE=${PREFIX}/bin/guile-3.0 \
		GUILE_CONFIG_EXECUTABLE=${PREFIX}/bin/guile-config-3.0
CMAKE_OFF=	NLOPT_JAVA
GNU_HOST=	${ARCH}-portbld-freebsd13.5
PLIST=		${PKGDIR}/pkg-plist.${FLAVOR}
PLIST_SUB=	GNU_HOST=${GNU_HOST} OCTAVE_VERSION=${OCTAVE_VERSION}
.elif ${FLAVOR} == minimal
CMAKE_OFF=	NLOPT_GUILE NLOPT_JAVA NLOPT_OCTAVE NLOPT_PYTHON NLOPT_SWIG
.endif

.include <bsd.port.mk>
