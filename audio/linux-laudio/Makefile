

PORTNAME=	laudio
PORTVERSION=	0.4
CATEGORIES=	audio linux
MASTER_SITES=	http://www.lossless-audio.com/
PKGNAMEPREFIX=	linux-
DISTNAME=	la04

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free lossless audio codec

ONLY_FOR_ARCHS=	amd64 i386

USES=		linux tar:bzip2
NO_BUILD=	yes

PLIST_FILES=	bin/laudio
PORTDOCS=	readme.txt

OPTIONS_DEFINE=	DOCS

do-install:
	${BRANDELF} -t Linux ${WRKDIR}/la
	${INSTALL_PROGRAM} ${WRKDIR}/la ${PREFIX}/bin/laudio
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/readme.txt ${DOCSDIR}

.include <bsd.port.mk>
