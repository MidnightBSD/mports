PORTNAME=	zfs-replicate
PORTVERSION=	2.0.2
DISTVERSIONPREFIX=	v
CATEGORIES=	filesystems sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS Snapshot Replication Script
WWW=		https://github.com/aaronhurt/zfs-replicate

LICENSE=	cddl

USES=	shebangfix

NO_BUILD=	yes
NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS EXAMPLES

SHEBANG_FILES=	zfs-replicate.sh

PORTDOCS=	README.md
PORTDATA=	config.sample.sh

USE_GITHUB=	yes
GH_ACCOUNT=	aaronhurt

PLIST_FILES=	sbin/zfs-replicate

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/zfs-replicate.sh \
		${PREFIX}/sbin/zfs-replicate

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${DATADIR}
.for data in ${PORTDATA}
	${INSTALL_DATA} ${WRKSRC}/${data} ${FAKE_DESTDIR}${DATADIR}
.endfor

.include <bsd.port.mk>
