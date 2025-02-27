PORTNAME=	foldingathome
DISTVERSION=	7.6.21
CATEGORIES=	biology linux
MASTER_SITES=	https://download.foldingathome.org/releases/v7/public/fahclient/centos-6.7-64bit/release/
PKGNAMEPREFIX=	linux-
DISTNAME=	fahclient-${DISTVERSION}-1
EXTRACT_SUFX=	.x86_64.rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Folding@home Client
WWW=		https://foldingathome.org/

# Distribution without permission is prohibited
LICENSE=	FAHSL
LICENSE_NAME=	Folding@home Software License
LICENSE_FILE=	${WRKSRC}/usr/share/doc/fahclient/copyright
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell \
		auto-accept

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	has not been ported to this architecture

USES=		dos2unix linux
DOS2UNIX_FILES=	usr/share/doc/fahclient/*
USE_RC_SUBR=	fahclient

ETCDIR=		${PREFIX}/etc/fahclient
DOCSDIR=	${PREFIX}/share/doc/fahclient
NO_BUILD=	yes

SUB_FILES=	pkg-message
SUB_LIST=	FAHCLIENT_CONFIG_XML=${_FAHCLIENT_CONFIG_XML} \
		FAHCLIENT_PROGRAM=${_FAHCLIENT_PROGRAM} \
		FAHCLIENT_WORK_DIR=${_FAHCLIENT_WORK_DIR}
NO_WRKSUBDIR=	yes

USERS=		fahclient
GROUPS=		fahclient

PLIST_SUB=	FAHCLIENT_WORK_DIR=${_FAHCLIENT_WORK_DIR}

PORTDOCS=	CHANGELOG.md README.md

OPTIONS_DEFINE=	DOCS

_FAHCLIENT_CONFIG_XML=	${ETCDIR}/config.xml
_FAHCLIENT_WORK_DIR=	/var/db/fahclient
_FAHCLIENT_PROGRAM=	${PREFIX}/bin/FAHClient

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/usr/bin/FAHClient ${PREFIX}/bin/
	${INSTALL_PROGRAM} ${WRKSRC}/usr/bin/FAHCoreWrapper ${PREFIX}/bin/
	@${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/usr/share/doc/fahclient/sample-config.xml \
		${_FAHCLIENT_CONFIG_XML}.sample
	@${MKDIR} ${FAKE_DESTDIR}${_FAHCLIENT_WORK_DIR}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/usr/share/doc/fahclient/|} \
		${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
