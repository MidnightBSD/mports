# New ports collection makefile for:	newsfetch
# Date created:		12 September 1997
# Whom:			Jun-ichiro itojun Itoh <itojun@itojun.org>
#

#

PORTNAME=	newsfetch
PORTVERSION=	1.21
PORTREVISION=	2
CATEGORIES=	news
MASTER_SITES=	SUNSITE/system/news/readers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Download news articles from NNTP server
LICENSE=	other

MAKE_ENV=	BINDIR="${PREFIX}/bin" MANDIR="${PREFIX}/man/man"

USES=		uidfix
CFLAGS+=	-Wno-return-type
PLIST_FILES=	bin/newsfetch \
		man/man1/newsfetch.1.gz

do-configure:
	(cd ${WRKSRC} && ( \
		${ECHO_CMD} "PROG= newsfetch"; \
		${ECHO_CMD} "SRCS=" *.c; \
		${ECHO_CMD} ".include <bsd.prog.mk>"; \
			) > Makefile)

.include <bsd.port.mk>
