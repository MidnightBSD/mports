# $MidnightBSD$

PORTNAME=	cdircmp
PORTVERSION=	0.3
CATEGORIES=	sysutils
MASTER_SITES=	CRITICAL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compare directories and select files to copy
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes
LDFLAGS+=	-lncurses -lform

PLIST_FILES=	bin/cdircmp

do-build:
	${CC} ${CFLAGS} -c ${WRKSRC}/main.c -o ${WRKSRC}/main.o
	${CC} ${LDFLAGS} -o ${WRKSRC}/${PORTNAME} ${WRKSRC}/main.o

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
