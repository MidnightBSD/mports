# $MidnightBSD$

PORTNAME=	shc
PORTVERSION=	3.8.6
CATEGORIES=	misc
MASTER_SITES=	http://www.datsi.fi.upm.es/~frosal/sources/ \
		CRITICAL
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A shell script "encoder"
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes

MAN1=		shc.1
PLIST_FILES=	bin/shc

do-build:
	${CC} ${CFLAGS} -o ${WRKSRC}/shc ${WRKSRC}/shc.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/shc ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/shc.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
