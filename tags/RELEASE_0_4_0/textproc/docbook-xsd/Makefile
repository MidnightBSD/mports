# ex:ts=8
# Ports collection makefile for:	docbook-xsd
# Date created:			Feb 9, 2004
# Whom:				ijliao
#
# $MidnightBSD: mports/textproc/docbook-xsd/Makefile,v 1.2 2008/05/31 17:40:49 laffer1 Exp $
# $FreeBSD: ports/textproc/docbook-xsd/Makefile,v 1.1 2004/02/11 03:31:08 ijliao Exp $
#

PORTNAME=	docbook-xsd
PORTVERSION=	1.0.b1
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/xmlschema/${PORTVERSION:S/.b/b/}/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.b/b/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DocBook W3C XML Schema
LICENSE=	unknown

USE_ZIP=	yes
NO_BUILD=	yes

do-install:
	@${MKDIR} ${DATADIR}
	@${CP} ${WRKSRC}/*.xsd ${DATADIR}
	@${FIND} ${DATADIR} -type f | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type d | ${SORT} -r | \
		${SED} 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}

.include <bsd.port.mk>
