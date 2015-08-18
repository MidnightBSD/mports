# $MidnightBSD$

PORTNAME=	etpro
PORTVERSION=	3.2.6
CATEGORIES=	games linux
MASTER_SITES=	http://bani.anime.net/etpro/ \
		http://dl.vpclan.de/etpro/ \
		http://www.enemyterritory.sk/files/ \
		ftp://download:etpro@preachers.cz/ \
		http://ftp.freenet.de/pub/4players/hosted/wolfenstein/users/mods/ \
		http://www.dakteam.org/ \
		http://www.enemyterritory.cl/files/
PKGNAMEPREFIX=	linux-enemyterritory-
DISTNAME=	${PORTNAME}-${PORTVERSION:S/./_/g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ET Pro - The Enemy Territory Competition Mod

LICENSE=	other

BUILD_DEPENDS=	et:${PORTSDIR}/games/linux-enemyterritory
RUN_DEPENDS=	et:${PORTSDIR}/games/linux-enemyterritory

USES=		zip
USE_LINUX=	f10
NO_WRKSUBDIR=	yes

RESTRICTED=	license does not allow redistribution

DATADIR=	${PREFIX}/lib/enemyterritory/${PORTNAME}

PLIST_SUB=	VERSION="${PORTVERSION:S/./_/g}"

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
	${CP} -R ${WRKSRC}/${PORTNAME}/* ${DATADIR}

.include <bsd.port.mk>
