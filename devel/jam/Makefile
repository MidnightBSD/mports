PORTNAME=	jam
PORTVERSION=	2.6
CATEGORIES=	devel
MASTER_SITES=	https://swarm.workshop.perforce.com/projects/perforce_software-jam/download/main/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build utility like make(1)
WWW=		https://www.perforce.com/jam/jam.html

LICENSE=	other

OPTIONS_DEFINE=	DOCS
USES=		zip

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.html ${DOCSDIR}

.include <bsd.port.mk>
