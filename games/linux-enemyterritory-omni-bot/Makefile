PORTNAME=	omni-bot
PORTVERSION=	0.66
PORTREVISION=	1
CATEGORIES=	games linux
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	alepulver
PKGNAMEPREFIX=	linux-enemyterritory-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Omni-Bot is a bot for Enemy Territory
WWW=		https://github.com/jswigart/omni-bot/

LICENSE=	Omnibot
LICENSE_NAME=	Omnibot
LICENSE_TEXT=	You can distribute binaries or make release packages for any OS. If you modify the source code, then you must make a pull request to this repository.
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

BUILD_DEPENDS=	et:games/linux-enemyterritory
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=		linux zip
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
