PORTNAME=	cvsps
PORTVERSION=	2.1
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	http://www.cobite.com/cvsps/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create patchset information from CVS
WWW=		https://cvsps.sourceforge.net/

LICENSE=	gpl2

USES=		gmake
ALL_TARGET=	cvsps

PLIST_FILES=	bin/cvsps share/man/man1/${PORTNAME}.1.gz

.if !defined(NOPORTDOCS)
PORTDOCS=	README
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cvsps ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/cvsps.1 ${PREFIX}/share/man/man1

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
