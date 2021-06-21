PORTNAME=	docbook-xsd
DISTVERSION=	1.0b1
CATEGORIES=	textproc
MASTER_SITES=	https://www.oasis-open.org/docbook/xmlschema/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DocBook W3C XML Schema

LICENSE=	unknown

USES=		zip
NO_BUILD=	yes

do-install:
	@${MKDIR} ${DATADIR}
	@${CP} ${WRKSRC}/*.xsd ${DATADIR}
	@${FIND} ${DATADIR} -type f | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type d | ${SORT} -r | \
		${SED} 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}

.include <bsd.port.mk>
