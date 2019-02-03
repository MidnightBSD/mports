# $MidnightBSD$

PORTNAME=	shc
PORTVERSION=	3.8.9
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://www.datsi.fi.upm.es/~frosal/sources/ \
		CRITICAL
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic script compiler

LICENSE=	gpl2

PLIST_FILES=	bin/shc man/man1/shc.1.gz

post-extract:
	@${RM} ${WRKSRC}/shc

do-build:
	${CC} ${CFLAGS} -o ${WRKSRC}/shc ${WRKSRC}/${PORTNAME}-${PORTVERSION}.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/shc ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/shc.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
