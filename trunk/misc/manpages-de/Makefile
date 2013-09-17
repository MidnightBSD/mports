# New ports collection makefile for: German manpages
# Date created:         29 September 1997
# Whom:                 wosch
#
# $FreeBSD: ports/german/manpages/Makefile,v 1.23 2005/02/16 16:21:28 wosch Exp $
# $MidnightBSD$

PORTNAME=	manpages-de
PORTVERSION=	0.4
CATEGORIES=	misc german
MASTER_SITES=	http://www.infodrom.org/projects/manpages-de/download/ \
		http://wolfram.schneider.org/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	German GNU and Linux manual pages
LICENSE=	unknown

LANG=		de.ISO8859-1
NO_WRKSUBDIR=	YES
PLIST=		${WRKSRC}/PLIST

mandir=		${PREFIX}/man/${LANG}
manpages=	${PORTNAME}-${PORTVERSION}

do-build:
	makewhatis ${WRKSRC}/${manpages}
.if !defined(NO_MANCOMPRESS)
	${GZIP_CMD} -r ${WRKSRC}/${manpages}/man* || exit 0
.endif

pre-install:
	${RM} -rf ${WRKSRC}/${manpages}/debian
	${FIND} ${WRKSRC}/${manpages} -type f -print | \
		 ${SED} "s%${WRKSRC}/${manpages}%man/${LANG}%" > ${PLIST}

do-install:
	cd ${WRKSRC}/${manpages}; \
	${TAR} cf - . | \
		(cd ${mandir}; ${TAR} xf - )

.include <bsd.port.mk>
