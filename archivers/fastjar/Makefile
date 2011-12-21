# $MidnightBSD$
# $FreeBSD: ports/archivers/fastjar/Makefile,v 1.17 2008/03/20 09:19:32 pav Exp $

PORTNAME=	fastjar
PORTVERSION=	0.93.20060808
CATEGORIES=	archivers java
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	maho/fastjar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A version of JDK's `jar' command written entirely in C
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}
GNU_CONFIGURE=	yes
PORTDOCS=	CHANGES README
PLIST_FILES=	bin/fastjar bin/grepjar
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
USE_PERL5_BUILD=	yes

INFO=		fastjar
MAN1=		fastjar.1 grepjar.1

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
