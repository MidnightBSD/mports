# $MidnightBSD$
# $FreeBSD: ports/games/linux-enemyterritory-omni-bot/Makefile,v 1.12 2008/02/19 13:20:31 alepulver Exp $

PORTNAME=	omni-bot
PORTVERSION=	0.66
CATEGORIES=	games linux
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	alepulver
PKGNAMEPREFIX=	linux-enemyterritory-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Omni-Bot is a bot for Enemy Territory

LICENSE=	other

BUILD_DEPENDS=	et:${PORTSDIR}/games/linux-enemyterritory
RUN_DEPENDS=	${BUILD_DEPENDS}

RESTRICTED=	mods are not redistributable

USES=		zip
USE_LINUX=	f10
NO_WRKSUBDIR=	yes

DATADIR=	${PREFIX}/lib/enemyterritory/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/enemyterritory-${PORTNAME}

do-build:
.for f in et etded
	@(${ECHO_CMD} "#!/bin/sh"; \
	${ECHO_CMD} 'exec ${PREFIX}/bin/${f} +set fs_game ${PORTNAME} +set omnibot_path "${DATADIR}" "$$@"') > \
		${WRKSRC}/${f}-${PORTNAME}
.endfor

do-install:
.for f in et etded
	${INSTALL_SCRIPT} ${WRKSRC}/${f}-${PORTNAME} ${PREFIX}/bin
.endfor
	${MKDIR} ${DATADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/omni-bot/omnibot_et.so ${DATADIR}
	cd ${WRKSRC}/omni-bot && ${CP} -R et global_scripts ${DATADIR}
	${INSTALL_PROGRAM} ${WRKSRC}/omnibot/qagame.mp.i386.so ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/omnibot/omnibot_et.pk3 ${DATADIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.   for f in *.txt omni-bot/*.txt
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.   endfor
	${CP} -R ${WRKSRC}/omni-bot/docs ${DOCSDIR}
.endif

.include <bsd.port.mk>
