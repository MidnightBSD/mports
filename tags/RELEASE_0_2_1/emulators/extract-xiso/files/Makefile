#
# $FreeBSD: ports/emulators/extract-xiso/files/Makefile,v 1.2 2005/10/06 19:05:29 mnag Exp $
#

LIBFTP_DIR=libftp-5.0.1.modified.by.in
CFLAGS+=-D__FREEBSD__

extract-xiso: extract-xiso.c
	@${MAKE} libftp
	${CC} ${CFLAGS} ${PTHREAD_LIBS} -o extract-xiso extract-xiso.c ${LIBFTP_DIR}/libftp.a

libftp:
	@${MAKE} -C ${LIBFTP_DIR}

clean:
	@${MAKE} -C ${LIBFTP_DIR} clean
	@rm -f extract-xiso

all:   extract-xiso

dist:
	@${MAKE} clean
	@${MAKE}
