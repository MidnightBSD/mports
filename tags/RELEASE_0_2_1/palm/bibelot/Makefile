# ex:ts=8
# New ports collection makefile for:	bibelot
# Date created:		Jan 8, 2001
# Whom:			Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $FreeBSD: ports/palm/bibelot/Makefile,v 1.9 2004/02/06 13:12:12 trevor Exp $
# $MidnightBSD$
#

PORTNAME=	bibelot
PORTVERSION=	0.9.4
CATEGORIES=	palm
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Formats and converts text documents into compressed PalmDoc .pdb files

PLIST_FILES=	bin/bibelot
USE_PERL5=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME}.pl ${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
