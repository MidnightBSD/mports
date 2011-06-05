# $MidnightBSD: mports/security/wipe/Makefile,v 1.3 2009/05/01 15:23:37 laffer1 Exp $

PORTNAME=	wipe
PORTVERSION=	2.3.0
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and block device wiping utility
LICENSE=	gpl2

FAKE_MAKEARGS+=	prefix=${FAKE_DESTDIR}${PREFIX}

USE_BZIP2=	yes
GNU_CONFIGURE=	yes

MAN1=		wipe.1
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
