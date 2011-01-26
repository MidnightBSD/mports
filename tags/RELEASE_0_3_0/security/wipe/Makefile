# $MidnightBSD: mports/security/wipe/Makefile,v 1.2 2007/10/31 03:24:09 laffer1 Exp $

PORTNAME=	wipe
PORTVERSION=	2.2.0
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and block device wiping utility
LICENSE=	gpl2

FAKE_MAKEARGS+=	prefix=${FAKE_DESTDIR}${PREFIX}

USE_BZIP2=	yes
GNU_CONFIGURE=	yes

MAN1=		wipe.1
PORTDOCS=	CHANGES INSTALL LICENSE README TESTING TODO copyright

.include <bsd.port.pre.mk>

EXTRA_PATCHES=	${PATCHDIR}/500040-patch-blkdev.c

post-install:
	${INSTALL_MAN} ${WRKSRC}/wipe.1 ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/wipe
	for i in ${PORTDOCS}; do \
		${INSTALL_DATA} ${WRKSRC}/$$i ${DOCSDIR}; \
	done
.endif

.include <bsd.port.post.mk>
