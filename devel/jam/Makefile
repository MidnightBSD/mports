# Created by: Jeffrey Hsu <hsu@FreeBSD.org>


PORTNAME=	jam
PORTVERSION=	2.5
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.perforce.com/jam/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build utility like make(1)

LICENSE=	other

OPTIONS_DEFINE=	DOCS
NO_WRKSUBDIR=	yes
WRKSRC=		${WRKDIR}
USES=		zip

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.html ${DOCSDIR}

.include <bsd.port.mk>
