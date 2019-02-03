# $MidnightBSD$

PORTNAME=	physfs
PORTVERSION=	2.0.3
CATEGORIES=	devel
MASTER_SITES=	http://offload1.icculus.org:9090/${PORTNAME}/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to provide abstract access to various archives

LICENSE=	other

USES=		cmake tar:bzip2

post-patch:
	@${REINPLACE_CMD} -e \
		's|CHECK_INCLUDE_FILE(sys/ucred.h HAVE_UCRED_H|& "-include sys/param.h"|g; \
		 s|CHECK_INCLUDE_FILE(readline/readline.h HAVE_READLINE_H|& "-include stdio.h"|g; \
		 s|CHECK_INCLUDE_FILE(readline/history.h HAVE_HISTORY_H|& "-include stdio.h"|g; \
		 s|CHECK_LIBRARY_EXISTS("readline" "history.*|SET(HAVE_LIBHISTORY TRUE)|g; \
		 s|" " \(readline curses\)|\1|' ${WRKSRC}/CMakeLists.txt

	@${REINPLACE_CMD} -e 's|\(define SIZEOF_INT\) 4|\1 (LONG_BIT/8)|g' \
		${WRKSRC}/platform/unix.c

.include <bsd.port.mk>
