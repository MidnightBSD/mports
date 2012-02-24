# $MidnightBSD: mports/archivers/rar/Makefile,v 1.11 2011/05/30 14:47:46 laffer1 Exp $

PORTNAME=	rar
PORTVERSION=	4.0.1
PORTEPOCH=	2
CATEGORIES=	archivers
MASTER_SITES=	http://www.rarlab.com/rar/
DISTNAME=	rarbsd-4.0.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File archiver (binary port)
LICENSE=	restricted

CONFLICTS=	rar-devel-*

IA32_BINARY_PORT=	YES
RESTRICTED=	only unmodified original package can be distributed
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/rar
PLIST_FILES=	bin/rar lib/default.sfx etc/rarfiles.lst man/cat1/rar.1
PORTDOCS=	technote.txt license.txt whatsnew.txt order.htm \
		readme.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rar_static ${PREFIX}/bin/rar
	${INSTALL_MAN} ${WRKSRC}/rar.txt ${PREFIX}/man/cat1/rar.1
	${INSTALL_DATA} ${WRKSRC}/rarfiles.lst ${PREFIX}/etc
	${INSTALL_DATA} ${WRKSRC}/default.sfx ${PREFIX}/lib

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
