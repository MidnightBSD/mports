# $MidnightBSD$

PORTNAME=	nttcp
PORTVERSION=	1.47
PORTREVISION=	3
CATEGORIES=	benchmarks net
MASTER_SITES=	http://freeware.sgi.com/source/nttcp/ \
		http://reality.sgiweb.org/freeware/source/nttcp/ \
		FREEBSD_LOCAL/martymac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client/server program for testing network performance

LICENSE=        nttcp
LICENSE_NAME=   nttcp license
LICENSE_TEXT=	This code was written and is copyrighted 1996,1997,1998 by \
        Elmar Bartel \
        Institut fuer Informatik \
        Technische Universitaet Muenchen \
        bartel@informatik.tu-muenchen.de \
  Permission to use, copy, modify and distribute this software \
  and its documentation for any purpose, except making money+, is \
  herby granted, provided that the above copyright notice and \
  this permission appears in all places, where this code is \
  referenced or used literally.
LICENSE_PERMS=  dist-mirror pkg-mirror

RESTRICTED=	No commercial use

ALL_TARGET=	nttcp
USES=		gmake
PLIST_FILES=	bin/nttcp man/man1/nttcp.1.gz
MAKE_ENV+=	OPT="${CFLAGS}"
NOPRECIOUSMAKEVARS=yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/nttcp ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/nttcp.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
