# $MidnightBSD$

PORTNAME=	bacula
PORTVERSION=	5.2.12
CATEGORIES=	sysutils
MASTER_SITES=	SF
PKGNAMESUFFIX=	-docs
DISTFILES=	${PORTNAME}-docs-${PORTVERSION}.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bacula document set
LICENSE=	agpl
# XXX is this right

NO_BUILD=	yes

UNIQUENAME=	${PORTNAME}${PKGNAMESUFFIX}

PORTDOCS=	*.pdf

.ifdef NOPORTDOCS
IGNORE=		consists of only documentation, please undef NOPORTDOCS and try again
.endif

do-install:
	${MKDIR} ${DOCSDIR}

	${FIND} ${WRKDIR}/${PORTNAME}-docs-${PORTVERSION}/manuals/en \
		-name "*.pdf" -exec ${INSTALL_DATA} {} ${DOCSDIR}/ \;

.include <bsd.port.mk>
