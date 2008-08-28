# New ports collection makefile for:    rar
# Date created:         June 5, 2008
# Whom:                 Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/archivers/rar/Makefile,v 1.5 2008/06/05 17:51:22 laffer1 Exp $
#

PORTNAME=	rar-devel
PORTVERSION=	3.80
CATEGORIES=	archivers
MASTER_SITES=	RAR
DISTNAME=	rarbsd-3.8.b1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File archiver (binary port)
LICENSE=	restricted

CONFLICTS=	rar-*

IA32_BINARY_PORT=	YES
RESTRICTED=	only unmodified original package can be distributed
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/rar
PLIST_FILES=	bin/rar lib/default.sfx etc/rarfiles.lst man/cat1/rar.1
PORTDOCS=	technote.txt license.txt whatsnew.txt order.htm \
		readme.txt file_id.diz

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rar ${TARGETDIR}/bin/rar
	${INSTALL_MAN} ${WRKSRC}/rar.txt ${TARGETDIR}/man/cat1/rar.1
	${INSTALL_DATA} ${WRKSRC}/rarfiles.lst ${TARGETDIR}/etc
	${INSTALL_DATA} ${WRKSRC}/default.sfx ${TARGETDIR}/lib

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
