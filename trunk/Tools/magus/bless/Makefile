# $MidnightBSD: mports/Tools/magus/bless/Makefile,v 1.1 2011/02/26 00:35:59 laffer1 Exp $
CC=c++
CFLAGS= -Wall -O2 -I/usr/local/include -std=c++11
LDFLAGS=-L/usr/local/lib/  -lpqxx -lpq -lsqlite3 -lmd -pthread
DESTDIR=
PREFIX=	/usr/local

all: clean magus

magus: magus-bless.cxx
	${CC} ${CFLAGS} ${LDFLAGS} -o magus-bless magus-bless.cxx

install: magus
	install -m 750 -u root -g wheel magus-bless ${DESTDIR}${PREFIX}

clean:
	rm -f *.o magus-bless
