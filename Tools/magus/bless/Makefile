# $MidnightBSD: mports/Tools/magus/bless/Makefile,v 1.1 2011/02/26 00:35:59 laffer1 Exp $
CC=cc
CFLAGS= -Wall -pedantic -std=c99 -O2 -I/usr/local/include -I/usr/local/include/mysql 
LDFLAGS=-L/usr/local/lib/mysql -L/usr/local/lib/ -lmysqlclient -lsqlite3 -lmd -pthread
DESTDIR=
PREFIX=	/usr/local

all: clean magus

magus: magus-bless.c
	${CC} ${CFLAGS} ${LDFLAGS} -o magus-bless magus-bless.c

install: magus
	install -m 750 -u root -g wheel magus-bless ${DESTDIR}${PREFIX}

clean:
	rm -f *.o magus-bless
