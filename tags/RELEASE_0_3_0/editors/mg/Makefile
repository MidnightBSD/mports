# New ports collection makefile for:	mg
# Date created:			14 May 2001
# Whom:				Dima Dorfman <dima@unixfreak.org>
#
# $MidnightBSD: mports/editors/mg/Makefile,v 1.4 2009/05/18 21:39:12 crash Exp $
# $FreeBSD: ports/editors/mg/Makefile,v 1.9 2006/11/19 12:28:48 miwi Exp $
#

PORTNAME=	mg
PORTVERSION=	20090107
CATEGORIES=	editors
MASTER_SITES=	http://www.han.dds.nl/software/mg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small, fast Emacs-like editor
LICENSE=	publicdom

MAN1=	mg.1
MANCOMPRESSED=	no

HAS_CONFIGURE=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN}  ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for FILE in README tutorial
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
