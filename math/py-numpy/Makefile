PORTNAME=	numpy
PORTVERSION=	1.26.4
PORTREVISION=	11
PORTEPOCH=	1
CATEGORIES=	math python
MASTER_SITES=	PYPI \
		https://numpy.org/doc/1.26/:doc
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	numpy-${PORTVERSION}${EXTRACT_SUFX} \
		numpy-html.zip:doc
DIST_SUBDIR=	numpy-${PORTVERSION:R}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The New Numeric Extension to Python
WWW=		https://www.numpy.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}meson-python>=0:devel/meson-python@${PY_FLAVOR}

USES=		compiler:c11 cpe fortran pkgconfig python shebangfix
USE_PYTHON=	autoplist concurrent cython pep517

# circular ref
NO_TEST=yes

GCCLIBDIR_CMDS=	${FC} -print-file-name=libgfortran.so | ${SED} -e \
		s/libgfortran.so//
PYDISTUTILS_CONFIGUREARGS=	--fcompiler=gnu95
PYDISTUTILS_BUILDARGS=	--fcompiler=gnu95

LDFLAGS+=	-s
PIE_UNSAFE=	yes

PORTSCOUT=	limit:^1\.

PORTDOCS=	*

OPTIONS_DEFINE=		DOCS SUITESPARSE
OPTIONS_DEFAULT=	OPENBLAS SUITESPARSE
OPTIONS_SINGLE=		BLASLIB
OPTIONS_SINGLE_BLASLIB=	ATLAS NETLIB OPENBLAS
SUITESPARSE_DESC=	Use AMD and UMFPACK in SuiteSparse

ATLAS_USES=			blaslapack:atlas
ATLAS_VARS=			BLASLIBS="ptf77blas, ptcblas" \
				BLASNAME=atlas \
				LAPACKLIBS=alapack \
				LIBRARIES=atlas_libs
NETLIB_LIB_DEPENDS=		libcblas.so:math/cblas
NETLIB_USES=			blaslapack:netlib
NETLIB_VARS=			BLASLIBS="blas, cblas" \
				BLASNAME=atlas \
				LAPACKLIBS=lapack \
				LIBRARIES=atlas_libs
OPENBLAS_USES=			blaslapack:openblas
OPENBLAS_VARS=			BLASLIBS="openblas, gfortran" \
				BLASNAME=openblas \
				LAPACKLIBS="openblas, gfortran" \
				LIBRARIES=libraries
SUITESPARSE_LIB_DEPENDS=	libumfpack.so:math/suitesparse-umfpack

SHEBANG_FILES=	numpy/f2py/crackfortran.py numpy/f2py/f2py2e.py \
		numpy/f2py/rules.py numpy/testing/print_coercion_tables.py \
		numpy/testing/setup.py

post-extract:
	@${TOUCH} ${WRKSRC}/numpy/f2py/tests/src/temp
	@${TOUCH} ${WRKSRC}/numpy/random/_examples/temp
	@${TOUCH} ${WRKSRC}/numpy/core/tests/examples/temp

pre-configure:
	@${REINPLACE_CMD} -e 's|%%FC%%|${FC}|' ${WRKSRC}/numpy/distutils/fcompiler/gnu.py
	@${CP} ${FILESDIR}/site.cfg ${WRKSRC}/site.cfg
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		-e 's|%%BLASLIBS%%|${BLASLIBS}|; s|%%BLASNAME%%|${BLASNAME}|' \
		-e 's|%%LAPACKLIBS%%|${LAPACKLIBS}|; s|%%LIBRARIES%%|${LIBRARIES}|' \
			${WRKSRC}/site.cfg
	@${REINPLACE_CMD} -e "s|%%GCCLIBDIR%%|$$(${GCCLIBDIR_CMDS})|" ${WRKSRC}/site.cfg ${WRKSRC}/numpy/distutils/system_info.py

pre-configure-SUITESPARSE-off:
	@${REINPLACE_CMD} -e 's|:%%LOCALBASE%%/include/suitesparse||' ${WRKSRC}/site.cfg

do-configure:

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' | ${XARGS} ${STRIP_CMD}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${UNZIP_NATIVE_CMD} -qo ${DISTDIR}/${DIST_SUBDIR}/numpy-html.zip -d ${FAKE_DESTDIR}${DOCSDIR}
	@${RM} ${FAKE_DESTDIR}${DOCSDIR}/.buildinfo

.include <bsd.port.mk>
