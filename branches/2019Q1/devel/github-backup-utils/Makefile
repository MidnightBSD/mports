# Created by: Ryan Steinmetz <zi@FreeBSD.org>
# $FreeBSD: head/devel/github-backup-utils/Makefile 387778 2015-05-28 22:22:59Z mat $
# $MidnightBSD$

PORTNAME=	github-backup-utils
PORTVERSION=	2.2.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GitHub Enterprise Backup Utilities

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

WRKSRC=		${WRKDIR}/${GH_PROJECT}-${PORTVERSION}

RUN_DEPENDS=	git>0:${PORTSDIR}/devel/git \
		rsync>0:${PORTSDIR}/net/rsync

USE_GITHUB=	yes
GH_ACCOUNT=	github
GH_PROJECT=	backup-utils
SUB_FILES=	pkg-message
NO_BUILD=	yes

post-patch:
	${REINPLACE_CMD} -e \
		's|/etc/github-backup-utils/backup.config|${PREFIX}/etc/github.backup.config|g' \
		${WRKSRC}/share/${PORTNAME}/ghe-backup-config

do-install:
	(cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${PREFIX}/bin)
	(cd ${WRKSRC}/share/${PORTNAME} && ${COPYTREE_BIN} . ${STAGEDIR}${DATADIR})
	${INSTALL_DATA} ${WRKSRC}/backup.config-example \
		${STAGEDIR}${PREFIX}/etc/github.backup.config.sample

.include <bsd.port.mk>
