# New ports collection makefile for:    rar
# Date created:         15 May 1996
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/rar/Makefile,v 1.7 2009/03/27 05:56:03 laffer1 Exp $
# $FreeBSD: ports/archivers/rar/Makefile,v 1.58 2006/09/03 01:35:39 kris Exp $
#

PORTNAME=	rar
PORTVERSION=	3.80
PORTEPOCH=	2
CATEGORIES=	archivers
MASTER_SITES=	RAR
DISTNAME=	rarbsd-3.8.0

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
		readme.txt file_id.diz

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
