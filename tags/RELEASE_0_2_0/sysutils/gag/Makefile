# New ports collection makefile for:	gag
# Date created:				31 Aug 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	gag
PORTVERSION=	4.9
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical Boot Manager
LICENSE=	gpl2

ONLY_FOR_ARCHS=	i386 amd64
USE_ZIP=	yes
NO_BUILD=	yes

# security/gag
CONFLICTS=	gag-2*
NO_LATEST_LINK=	yes

do-install:
# Data
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
