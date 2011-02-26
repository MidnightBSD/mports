# $MidnightBSD: mports/Tools/magus/ftp/Makefile,v 1.1 2008/09/10 13:07:01 laffer1 Exp $
CC=cc
CFLAGS= -Wall -pedantic -std=c99 -O2 -I/usr/local/include -I/usr/local/include/mysql 
LDFLAGS=-L/usr/local/lib/mysql -lmysqlclient -lsqlite3
DESTDIR=
PREFIX=	/usr/local

all: clean magus

magus: magus-bless.c
	${CC} ${CFLAGS} ${LDFLAGS} -o magus-bless magus-bless.c

install: magus
	install -m 750 -u root -g wheel magus-bless ${DESTDIR}${PREFIX}

clean:
	rm -f *.o magus-bless
