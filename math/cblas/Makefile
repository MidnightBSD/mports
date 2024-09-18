PORTNAME=	cblas

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference implementation of the C interface to the legacy Fortran BLAS
WWW=		https://www.netlib.org/blas/blast-forum/

DESCR=	${.CURDIR}/pkg-descr
CBLAS_SLAVEPORT=	yes

NO_TEST=	yes

MASTERDIR=	${.CURDIR}/../lapack

.include "${MASTERDIR}/Makefile"
