PORTNAME=	mumps
DISTVERSION=	5.1.2-aster7
CATEGORIES=	math
PKGNAMESUFFIX=	-edf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MUltifrontal Massively Parallel sparse direct Solver for Code_Aster
WWW=		https://mumps-solver.org/

LICENSE=	CeCILL_C
LICENSE_NAME=	CeCILL-C
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LIB_DEPENDS=	libmetis.so:math/metis

USES=		blaslapack fortran

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:R}
FORTRANLIBS=	-lgfortran
GCCLIBDIR=	${LDFLAGS}
USE_LDCONFIG=	yes
VEM=		${PORTVERSION:R:R:R}
MUMPSVERSION=	${PORTVERSION:R}
LIBS=	cmumps dmumps mumps_common pord smumps zmumps
SEQ_LIBS=	${LIBS} mpiseq
PLIST_SUB=	VE=${VEM} MUMPSVERSION=${MUMPSVERSION}

OPTIONS_DEFINE=	DOCS EXAMPLES

MAKE_JOBS_UNSAFE=yes

.include <bsd.port.pre.mk>
.include "${.CURDIR}/../../french/aster/bsd.aster.mk"

.if ${GCC_DEFAULT} >= 10
# workaround for Type mismatch in argument 's' at (1); passed INTEGER(4) to LOGICAL(4)
FCFLAGS+=	-fallow-argument-mismatch
.endif

.if ${FORTRAN_DEFAULT} == gfortran && ${GCC_DEFAULT} >= 10
FCFLAGS+=	-fallow-argument-mismatch
.endif

post-patch:
	${INSTALL_DATA} ${WRKSRC}/Make.inc/Makefile.FREEBSD10.SEQ \
		${WRKSRC}/Makefile.inc

pre-configure:
	${DIRNAME} `${FC} -print-libgcc-file-name` > ${WRKSRC}/LIBDIR
.for MF in Makefile Makefile.inc PORD/lib/Makefile libseq/Makefile src/Makefile
	${REINPLACE_CMD} -e 's+@CC@+${CC}+g ; s+@FC@+${FC}+g ; \
	s+/usr/local+${LOCALBASE}+; \
	s+@CFLAGS@+${CFLAGS} -fPIC+g; \
	s+@FCFLAGS@+${FCFLAGS} -fPIC+g; \
	s+@SOVER@+${VEM}+g; \
	s+@GCCLIBDIR@+${GCCLIBDIR}+g; \
	s+@FORTRANLIBS@+${FORTRANLIBS}+g; \
	s+@BLAS_LIBS@+${BLASLIB}+ ; \
	s+@LAPACK_LIBS@+${LAPACKLIB}+ ; \
	s+@LOCALBASE@+${LOCALBASE}+g;' \
		${WRKSRC}/${MF}
.endfor

do-install:
	${INSTALL_DATA} ${WRKSRC}/include/*.h ${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/lib/lib*.a ${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/lib/lib*.so.${VEM} ${PREFIX}/lib
.for lib in ${LIBS}
	(cd ${PREFIX}/lib &&	\
	${LN} -sf lib${lib}.so.${VEM} ${PREFIX}/lib/lib${lib}.so)
.endfor
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/userguide_${MUMPSVERSION}.pdf ${DOCSDIR}
	${MKDIR} ${EXAMPLESDIR}
.for ex in Makefile README *.c *.F input_simpletest_*
	${INSTALL_DATA} ${WRKSRC}/examples/${ex} ${EXAMPLESDIR}
.endfor
.for ex in c_example *simpletest
	${INSTALL_PROGRAM} ${WRKSRC}/examples/${ex} ${EXAMPLESDIR}
.endfor
	${MKDIR} ${PREFIX}/include/mumps_seq
	${INSTALL_DATA} ${WRKSRC}/libseq/mpi.h ${PREFIX}/include/mumps_seq/mpi.h
	${INSTALL_DATA} ${WRKSRC}/libseq/libmpiseq.a ${PREFIX}/lib
	${INSTALL_LIB} ${WRKSRC}/libseq/libmpiseq*.so.${VEM} ${PREFIX}/lib
	(cd ${PREFIX}/lib &&	\
	${LN} -sf libmpiseq.so.${VEM} ${PREFIX}/lib/libmpiseq.so)
.for lib in ${SEQ_LIBS}
. for ext in a so so.${VEM}
	(cd ${PREFIX}/lib &&	\
	${LN} -sf lib${lib}.${ext} ${PREFIX}/lib/lib${lib}_seq.${ext})
. endfor
.endfor

test:	build
	(cd ${WRKSRC}/examples &&	\
	./ssimpletest < input_simpletest_real ;			\
	./dsimpletest < input_simpletest_real ;			\
	./csimpletest < input_simpletest_cmplx ;		\
	./zsimpletest < input_simpletest_cmplx ;		\
	${ECHO_MSG} "The solution should be (1,2,3,4,5)" ;	\
	./c_example ;						\
	${ECHO_MSG} "The solution should be (1,2)")

.include <bsd.port.post.mk>
