PORTNAME=	eigen
DISTVERSION=	3.4.0
PORTREVISION=	3
CATEGORIES=	math

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight library for vector and matrix math
WWW=		https://eigen.tuxfamily.org/

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	multi
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LGPL
LICENSE_FILE_mpl=	${WRKSRC}/COPYING.MPL2

TEST_DEPENDS=	suitesparse-cholmod>0:math/suitesparse-cholmod \
		suitesparse-umfpack>0:math/suitesparse-umfpack \
		superlu>0:math/superlu	\
		adol-c>0:math/adol-c \
		fftw3>0:math/fftw3 \
		mpfr>0:math/mpfr \
		gmp>0:math/gmp \
		boost-libs>0:devel/boost-libs

USES=		cmake:testing
USE_GITLAB=	yes
GL_ACCOUNT=	libeigen
GL_TAGNAME=	3147391d946bb4b6c68edd901f2add6ac1f31f8c

CMAKE_ARGS=	-DPKGCONFIG_INSTALL_DIR:PATH="libdata/pkgconfig"
CMAKE_ON=	EIGEN_TEST_CXX11 # This is to set the C++ standard to C++11, instead of 03
CMAKE_TESTING_ON=	EIGEN_TEST_CUDA EIGEN_TEST_CUDA_CLANG

NO_BUILD=	yes
NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	BLAS
OPTIONS_DEFAULT=BLAS

BLAS_DESC=	Adds math dependencies
BLAS_CMAKE_ON=	-DBLAS_DIR:PATH="${LOCALBASE}"
BLAS_USES=	blaslapack pkgconfig

.include <bsd.port.mk>
