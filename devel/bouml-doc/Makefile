# New ports collection makefile for:	bouml-doc
# Date created:		23 December 2007
# Whom:			Thierry Thomas <thierry@pompo.net>
#
# $FreeBSD: ports/devel/bouml-doc/Makefile,v 1.5 2008/05/06 22:05:31 thierry Exp $
# $MidnightBSD$

PORTNAME=	bouml-doc
PORTVERSION=	4.3.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}	\
		http://bouml.free.fr/
MASTER_SITE_SUBDIR=	bouml
DISTNAME=	doc${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reference manual of BOUML
LICENSE=        gpl2
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/doc
DOCSDIR=	${PREFIX}/share/doc/bouml

do-install:
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \* ${DOCSDIR})

.include <bsd.port.mk>
