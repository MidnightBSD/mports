# Created by: Emanuel Haupt <ehaupt@critical.ch>

PORTNAME=	zonenotify
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://www.morettoni.net/bsd/ \
		FREEBSD_LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS notify sender written in C

LICENSE=	bsd2

PLIST_FILES=	bin/zonenotify
WRKSRC=		${WRKDIR}/${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${FAKE_DESTDIR}${TRUE_PREFIX}|' \
		${WRKSRC}/Makefile

do-build:
	${CC} -o ${WRKSRC}/${PORTNAME} ${CFLAGS} ${WRKSRC}/${PORTNAME}.c

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
