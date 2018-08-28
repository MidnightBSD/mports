# $MidnightBSD$
# $FreeBSD: head/multimedia/plexpy/Makefile 420285 2016-08-16 15:39:20Z feld $

PORTNAME=	plexpy
PORTVERSION=	1.4.10
PORTREVISION=	0
CATEGORIES=	multimedia python
DISTVERSIONPREFIX=v

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monitoring, analytics, and notifications for Plex Media Server

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		${PYTHON_PKGNAMEPREFIX}openssl>0:${PORTSDIR}/security/py-openssl \
		${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss

USE_RC_SUBR=	${PORTNAME}
SUB_LIST=	PYTHON_CMD=${PYTHON_CMD}

USES=		python:2 shebangfix
SHEBANG_FILES=	PlexPy.py
python_OLD_CMD=	/bin/sh

USE_GITHUB=	yes
GH_ACCOUNT=	drzoidberg33
NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/plexpy
	${MKDIR} ${STAGEDIR}${PREFIX}/plexpy/data
	${MKDIR} ${STAGEDIR}${PREFIX}/plexpy/lib
	${MKDIR} ${STAGEDIR}${PREFIX}/plexpy/plexpy
	cd ${WRKSRC} && ${COPYTREE_SHARE} data ${STAGEDIR}${PREFIX}/plexpy
	cd ${WRKSRC} && ${COPYTREE_SHARE} lib ${STAGEDIR}${PREFIX}/plexpy
	cd ${WRKSRC} && ${COPYTREE_SHARE} plexpy ${STAGEDIR}${PREFIX}/plexpy
	${INSTALL_SCRIPT} ${WRKSRC}/PlexPy.py ${STAGEDIR}${PREFIX}/plexpy
	${INSTALL_DATA} ${WRKSRC}/CHANGELOG.md ${STAGEDIR}${PREFIX}/plexpy

.include <bsd.port.mk>
