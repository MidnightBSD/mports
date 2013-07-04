# $MidnightBSD$
CC=cc
CFLAGS= -Wall -pedantic -std=c99 -O2 -I/usr/local/include -I/usr/local/include/mysql 
LDFLAGS=-L/usr/local/lib/mysql -lmysqlclient
DESTDIR=
PREFIX=	/usr/local

all: clean magus

magus: magus.c
	${CC} ${CFLAGS} ${LDFLAGS} -o magus magus.c

install: magus
	install -m 750 -u root -g wheel magus ${DESTDIR}${PREFIX}

clean:
	rm -f *.o magus
