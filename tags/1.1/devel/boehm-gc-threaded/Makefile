# $MidnightBSD$

PORTREVISION=	1

COMMENT=	Garbage collection and memory leak detection for C and C++ with threading support

LICENSE=	mit

MASTERDIR=	${.CURDIR}/../boehm-gc
DESCR=		${.CURDIR}/pkg-descr

GC_VARIANT=	threaded

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

.include "${MASTERDIR}/Makefile"
