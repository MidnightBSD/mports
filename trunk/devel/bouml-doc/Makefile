# $MidnightBSD: mports/devel/bouml-doc/Makefile,v 1.1 2008/05/12 15:33:42 crash Exp $

PORTNAME=	bouml-doc
PORTVERSION=	4.12.4
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
