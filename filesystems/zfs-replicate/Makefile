PORTNAME=	zfs-replicate
PORTVERSION=	0.7
PORTREVISION=	2
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS Snapshot Replication Script
WWW=		https://github.com/leprechau/zfs-replicate

LICENSE=	cddl

RUN_DEPENDS=	bash:shells/bash

USES=	shebangfix

NO_BUILD=	yes
NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS EXAMPLES

SHEBANG_FILES=	zfs-replicate.sh

PORTDOCS=	README.md
PORTDATA=	config.sample.sh

USE_GITHUB=	yes
GH_ACCOUNT=	leprechau
GH_TAGNAME=	17bf8fb

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
