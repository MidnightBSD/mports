PORTNAME=	cvsps
DISTVERSION=	2.2b1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/
PKGNAMESUFFIX?=	-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CVS patchsets
WWW=		https://cvsps.sourceforge.net/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

CONFLICTS=	cvsps

USES=		gmake
ALL_TARGET=	cvsps

PLIST_FILES=	bin/${PORTNAME} \
		share/man/man1/${PORTNAME}.1.gz
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 \
		${PREFIX}/share/man/man1/

do-install-DOCS-on:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}/

.include <bsd.port.mk>
