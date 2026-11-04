CC=c++
CFLAGS= -Wall -g -I/usr/local/include -std=c++17
LDFLAGS=-L/usr/local/lib/  -lpqxx -lpq -lmd -pthread
DESTDIR=
PREFIX=	/usr/local

all: clean distcheck

distcheck: distcheck.cxx
	${CC} ${CFLAGS} ${LDFLAGS} -o distcheck distcheck.cxx

install: distcheck
	install -m 750 -u root -g wheel distcheck ${DESTDIR}${PREFIX}

clean:
	rm -f *.o distcheck
