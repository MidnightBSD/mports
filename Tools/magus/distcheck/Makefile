CC=c++
CFLAGS= -Wall -O2 -I/usr/local/include -std=c++17
LDFLAGS=-L/usr/local/lib/  -lpqxx -lpq -lsqlite3 -lmd -pthread
DESTDIR=
PREFIX=	/usr/local

all: clean distcheck

distcheck: distcheck.cxx
	${CC} ${CFLAGS} ${LDFLAGS} -o distcheck distcheck.cxx

install: distcheck
	install -m 750 -u root -g wheel distcheck ${DESTDIR}${PREFIX}

clean:
	rm -f *.o distcheck
