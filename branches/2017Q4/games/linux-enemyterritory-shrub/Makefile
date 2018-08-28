# $MidnightBSD$
# $FreeBSD: ports/games/linux-enemyterritory-shrub/Makefile,v 1.2 2006/05/31 01:43:26 alepulver Exp $

PORTNAME=	shrub
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	games linux
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=   alepulver
PKGNAMEPREFIX=	linux-enemyterritory-
DISTNAME=	1.2-test13-l

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shrub - An Enemy Territory Modification

LICENSE=	other

BUILD_DEPENDS=	et:${PORTSDIR}/games/linux-enemyterritory
RUN_DEPENDS=	${BUILD_DEPENDS}

RESTRICTED=	not redistributable

USES=		zip
USE_LINUX=	f10
NO_WRKSUBDIR=	yes

DATADIR=	${PREFIX}/lib/enemyterritory/${PORTNAME}

PLIST_FILES=	bin/et-${PORTNAME} \
		bin/etded-${PORTNAME} \
		%%DATADIR%%/qagame.mp.i386.so
PLIST_DIRS=	%%DATADIR%%

do-build:
.for f in et etded
	@(${ECHO} "#!/bin/sh"; \
	${ECHO} 'exec ${PREFIX}/bin/${f} +set fs_game ${PORTNAME} "$$@"') > \
		${WRKSRC}/${f}-${PORTNAME}
.endfor

do-install:
.for f in et etded
	${INSTALL_SCRIPT} ${WRKSRC}/${f}-${PORTNAME} ${PREFIX}/bin
.endfor
	${MKDIR} ${DATADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/qagame.mp.i386.so ${DATADIR}

.include <bsd.port.mk>
