# $MidnightBSD$
# $FreeBSD: ports/textproc/fixrtf/src/Makefile,v 1.1 2006/03/16 07:50:15 delphij Exp $

PROG=	fixrtf
SRCS=	fixrtf.l

#PREFIX?=	/usr/local
BINDIR=	${PREFIX}/bin
CFLAGS+=-I${PREFIX}/include
LDADD=	-L${PREFIX}/lib -lpng
NO_MAN=
NOMAN=

.include <bsd.prog.mk>
