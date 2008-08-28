# New ports collection makefile for:    unarj
# Date created:         28 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/unarj/Makefile,v 1.2 2008/03/12 01:57:39 laffer1 Exp $
# $FreeBSD: ports/archivers/unarj/Makefile,v 1.22 2006/08/23 06:34:55 ache Exp $
#

PORTNAME=	unarj
PORTVERSION=	2.65
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	ache
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allows files to be extracted from ARJ archives
LICENSE=	restricted

PLIST_FILES=	bin/unarj
PORTDOCS=	unarj.txt technote.txt

post-patch:
	${CP} ${FILESDIR}/sanitize.c ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unarj ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	${INSTALL} -d -m 755 -o ${SHAREOWN} -g ${SHAREGRP} ${DOCSDIR}
.for i in ${PORTDOCS}	
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
