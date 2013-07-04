# New ports collection makefile for:	ftpcopy
# Date created:				14 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/ftp/ftpcopy/Makefile,v 1.1 2007/11/14 21:00:07 laffer1 Exp $
# $FreeBSD: ports/ftp/ftpcopy/Makefile,v 1.24 2004/08/13 16:52:19 krion Exp $
#

PORTNAME=	ftpcopy
PORTVERSION=	0.6.7
CATEGORIES=	ftp ipv6
MASTER_SITES=	http://www.ohse.de/uwe/ftpcopy/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line ftp tools for listing and mirroring
LICENSE=	gpl2

USE_PERL5_BUILD=	yes

WRKSRC=		${WRKDIR}/web/${DISTNAME}

MAN1=		ftpcopy.1 ftpcp.1 ftpls.1

pre-build:
	${ECHO} "${CC}" >${WRKSRC}/src/conf-cc
	${ECHO} "${CPPFLAGS} ${CFLAGS}" >${WRKSRC}/src/conf-cflags
	${ECHO} "${LDFLAGS}" >${WRKSRC}/src/conf-ldflags

do-install:
	cd ${WRKSRC}/compile && \
		${INSTALL_PROGRAM} ftpcopy ftpls ${PREFIX}/bin && \
		${INSTALL_MAN} ${MAN1} ${PREFIX}/man/man1 && \
		${INSTALL_SCRIPT} ftpcp ${PREFIX}/bin
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR} && \
	cd ${WRKSRC}/compile && \
		${INSTALL_DATA} ChangeLog NEWS \
			README THANKS ftpcopy.html ftpls.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
