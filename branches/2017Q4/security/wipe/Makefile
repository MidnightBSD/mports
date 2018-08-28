# $MidnightBSD$

PORTNAME=	wipe
PORTVERSION=	2.3.1
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and block device wiping utility

LICENSE=	gpl2

FAKE_MAKEARGS+=	prefix=${FAKE_DESTDIR}${PREFIX}

USES=		tar:bzip2
GNU_CONFIGURE=	yes

PORTDOCS=	CHANGES INSTALL LICENSE README TESTING TODO copyright

post-patch:
	@${REINPLACE_CMD} -e 's|@CFLAGS@|${CFLAGS}|' ${WRKSRC}/Makefile.in

post-install:
	${INSTALL_MAN} ${WRKSRC}/wipe.1 ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/wipe
	for i in ${PORTDOCS}; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${DOCSDIR}; \
	done
.endif

.include <bsd.port.mk>
