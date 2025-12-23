PORTNAME=	github-backup-utils
PORTVERSION=	3.16.3
DISTVERSIONPREFIX=	v
CATEGORIES=	devel
MASTER_SITES=	https://github.com/github/backup-utils/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GitHub Enterprise Backup Utilities
WWW=		https://github.com/github/backup-utils

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	bash:shells/bash \
		git:devel/git \
		rsync:net/rsync

USES=		shebangfix

NO_ARCH=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

SHEBANG_FILES=	bin/* share/github-backup-utils/*

post-patch:
	@${REINPLACE_CMD}  -e 's|%%PREFIX%%|${TRUE_PREFIX}|' ${WRKSRC}/share/github-backup-utils/ghe-backup-config
	-${RM} ${WRKSRC}/share/github-backup-utils/ghe-backup-config.orig
	-${RM} ${WRKSRC}/share/github-backup-utils/ghe-backup-config.bak

do-install:
	cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/docs/backup.config-example ${STAGEDIR}${PREFIX}/etc/github.backup.config.sample
	cd ${WRKSRC}/share/github-backup-utils && ${COPYTREE_BIN} . ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
