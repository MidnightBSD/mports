PORTNAME=	newsfetch
PORTVERSION=	1.21
PORTREVISION=	4
CATEGORIES=	news
MASTER_SITES=	SUNSITE/system/news/readers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Download news articles from NNTP server
LICENSE=	other

MAKE_ENV=	BINDIR="${PREFIX}/bin" MANDIR="${PREFIX}/share/man/man"

USES=		dos2unix uidfix
DOS2UNIX_GLOB=	*.c
CFLAGS+=	-Wno-return-type
PLIST_FILES=	bin/newsfetch \
		share/man/man1/newsfetch.1.gz

do-configure:
	(cd ${WRKSRC} && ( \
		${ECHO_CMD} "PROG= newsfetch"; \
		${ECHO_CMD} "SRCS=" *.c; \
		${ECHO_CMD} ".include <bsd.prog.mk>"; \
			) > Makefile)

.include <bsd.port.mk>
