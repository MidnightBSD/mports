# New ports collection makefile for:	gag
# Date created:				31 Aug 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>

PORTNAME=	gag
PORTVERSION=	4.10
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}+${PORTVERSION}
DISTNAME=	${PORTNAME}4_10

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical Boot Manager
LICENSE=	gpl2

USES=		zip
NO_BUILD=	yes

# security/gag
CONFLICTS=	gag-2*
WRKSRC=		${WRKDIR}/gag4.10/

do-install:
	@${MKDIR} ${DATADIR}
.for f in cdrom.iso disk.dsk
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DATADIR}
.endfor

# Documentation (optional)
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC}/docs && pax -r -w . ${DOCSDIR}/ )
.endif

.include <bsd.port.mk>
