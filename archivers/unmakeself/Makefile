PORTNAME=	unmakeself
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	archivers
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extract Makeself archives

LICENSE=	bsd3

USES=		libarchive
LDFLAGS=	-larchive -lbz2 -lz -lcrypto -lmd
NO_WRKSUBDIR=	yes

PLIST_FILES=	bin/unmakeself

.include <bsd.port.pre.mk>

do-configure:
	@${RM} -f ${WRKSRC}/config.h
	@if ${GREP} -q memmem /usr/include/string.h; then \
		${ECHO_CMD} "#define HAS_MEMMEM" > ${WRKSRC}/config.h; \
	else \
		${ECHO_CMD} "#undef HAS_MEMMEM" > ${WRKSRC}/config.h; \
	fi

do-build:
	${CC} ${CFLAGS} ${CPPFLAGS} -I${WRKSRC} -o ${WRKSRC}/unmakeself \
		${FILESDIR}/unmakeself.c ${LDFLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unmakeself ${PREFIX}/bin

.include <bsd.port.post.mk>
