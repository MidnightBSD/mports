# Created by: Daniel O'Connor

PORTNAME=	teamspeak3-server
PORTVERSION=	3.13.6
PORTEPOCH=	1
CATEGORIES=	audio net
MASTER_SITES=	https://files.teamspeak-services.com/releases/server/${PORTVERSION}/
DISTNAME=	${PORTNAME}_freebsd_${TEAMSPEAK_ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Server side of the TeamSpeak group voice chat system

LICENSE=	teamspeak
LICENSE_NAME=	TeamSpeak 3.x End User License Agreement
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell

ONLY_FOR_ARCHS=	amd64

RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		tar:bz2
USE_LDCONFIG=	${LIBDIR}
USE_RC_SUBR=	teamspeak

NO_BUILD=	yes
SUB_FILES=	pkg-message

USERS=	teamspeak
GROUPS=	teamspeak

CONFLICTS=	teamspeak_server

PLIST_SUB=	DBDIR=${DBDIR} \
		ETCDIR=${ETCDIR} \
		LOGDIR=${LOGDIR} \
		BINGRP=${BINGRP}

SUB_LIST=	DBDIR=${DBDIR} \
		ETCDIR=${ETCDIR} \
		LOGDIR=${LOGDIR}

PORTDOCS=	accounting.txt \
		permissiondoc.txt \
		privilegekey_guide.txt \
		server_quickstart.md \
		server_upgrade.txt \
		update_mysql_to_mariadb.txt \
		webquery.md

OPTIONS_DEFINE=	DOCS MYSQL

MYSQL_USES=	mysql:server
MYSQL_VARS=	SUB_LIST+=MYSQL=mysql
MYSQL_VARS_OFF=	SUB_LIST+=MYSQL=

.include <bsd.mport.options.mk>

.if ${ARCH} == "i386"
TEAMSPEAK_ARCH=	x86
.elif ${ARCH} == "amd64"
TEAMSPEAK_ARCH=	amd64
.endif

WRKSRC=	${WRKDIR}/${PORTNAME}_freebsd_${TEAMSPEAK_ARCH}

DBDIR=	/var/db/teamspeak
ETCDIR=	${PREFIX}/etc/teamspeak
LIBDIR=	${PREFIX}/lib/teamspeak/server
LIBEXECDIR=	${PREFIX}/libexec
LOGDIR=	/var/log/teamspeak
SHAREDIR=	${PREFIX}/share/teamspeak/server

do-install:
	@${MKDIR} ${SHAREDIR}
	${INSTALL_DATA} ${WRKSRC}/CHANGELOG ${SHAREDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENSE ${SHAREDIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} "sql serverquerydocs" ${SHAREDIR})

	@${MKDIR} ${LIBDIR}
	${INSTALL_LIB} ${WRKSRC}/*.so ${LIBDIR}
	${INSTALL_LIB} ${WRKSRC}/redist/*.so* ${LIBDIR}

	${INSTALL_PROGRAM} ${WRKSRC}/ts3server \
		${LIBEXECDIR}/

	@${MKDIR} ${DOCSDIR}
.	for DOCFILE in ${PORTDOCS}
		${INSTALL_DATA} ${WRKSRC}/doc/${DOCFILE} ${DOCSDIR}
.	endfor

	${INSTALL} -d ${FAKE_DESTDIR}${DBDIR}
	${INSTALL} -d ${FAKE_DESTDIR}${LOGDIR}
	${INSTALL} -d ${ETCDIR}

# Add link to serverquerydocs, this needs to be in the
# same directory as chdir or help commands will fail.
	${RLN} ${SHAREDIR}/serverquerydocs ${FAKE_DESTDIR}${DBDIR}

.include <bsd.port.mk>
