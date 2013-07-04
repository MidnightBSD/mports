# $MidnightBSD: mports/archivers/rar/Makefile,v 1.13 2012/11/27 02:26:47 laffer1 Exp $

PORTNAME=	rar
PORTVERSION=	4.2.0
PORTEPOCH=	3
CATEGORIES=	archivers
MASTER_SITES=	http://www.rarlab.com/rar/
DISTNAME=	rarbsd-${PORTVERSION}

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
