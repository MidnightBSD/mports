PORTNAME=	jaymod
PORTVERSION=	2.2.0
PORTREVISION=	1
CATEGORIES=	games linux
MASTER_SITES=	http://jaymod.clanfu.org/lib/downloads/ \
		http://www.zenenterprises.biz/bud/jaymod/
PKGNAMEPREFIX=	linux-enemyterritory-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jaymod - An Enemy Territory Modification
WWW=		https://jaymod.clanfu.org/

LICENSE=	other

RUN_DEPENDS=	et:games/linux-enemyterritory

USES=		linux

OPTIONS_DEFINE=	DOCS OMNIBOT
OMNIBOT_DESC=	Install Omni-Bot for bot support

DATADIR=	${PREFIX}/lib/enemyterritory/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/enemyterritory-${PORTNAME}

CLIENT_PK3=	${PORTNAME}-${PORTVERSION}.pk3
PLIST_SUB=	CLIENT_PK3="${CLIENT_PK3}"

OMNIBOT_RUN_DEPENDS=	et-omni-bot:games/linux-enemyterritory-omni-bot

.include <bsd.mport.options.mk>

do-build:
.for f in et etded
	@(${ECHO_CMD} "#!/bin/sh"; \
	${ECHO_CMD} 'exec ${PREFIX}/bin/${f} +set fs_game ${PORTNAME} +set omnibot_path "${DATADIR}/../omni-bot" "$$@"') > \
		${WRKSRC}/${f}-${PORTNAME}
.endfor

do-install:
.for f in et etded
	@${INSTALL_SCRIPT} ${WRKSRC}/${f}-${PORTNAME} ${PREFIX}/bin
.endfor
	@${MKDIR} ${DATADIR}
	@${INSTALL_PROGRAM} ${WRKSRC}/qagame.mp.i386.so ${DATADIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${CLIENT_PK3} ${DATADIR}
.for f in jaymod.cfg server.cfg
	@${CP} -p ${WRKSRC}/${f} ${DATADIR}/${f}.sample
.endfor
	@${CP} -r ${WRKSRC}/linux ${WRKSRC}/mapscripts ${DATADIR}
	@${MKDIR} ${DOCSDIR}
.for f in README.txt doc/jaymod.pdf
	@cd ${WRKSRC} && ${INSTALL_DATA} ${f} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
