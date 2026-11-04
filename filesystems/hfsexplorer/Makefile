PORTNAME=	hfsexplorer
DISTVERSIONPREFIX=	${PORTNAME}-
DISTVERSION=	2021.10.9
CATEGORIES=	filesystems sysutils java

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HFSExplorer read Mac-formatted harddisks and disk images
WWW=		https://www.catacombae.org/hfsexplorer/

LICENSE=	gpl3

BUILD_DEPENDS=	ant:devel/apache-ant

USES=		java
USE_GITHUB=	yes
GH_ACCOUNT=	unsound

DESKTOP_ENTRIES=	"hfsexplorer" \
			"reader Mac-formatted harddisk" \
			"${DATADIR}/res/icon.png" \
			"${PORTNAME}" \
			"System;Utility;Java;" \
			false

NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS

do-configure:
	@cd ${WRKSRC}/dist/bin && ${REINPLACE_CMD} -e 's|BASEDIR=".*"|BASEDIR="${DATADIR}/lib"|g' \
		hfsx resview unhfs
	@${REINPLACE_CMD} -e 's|BASEDIR=".*"|BASEDIR="${DATADIR}/lib"|g' \
		${WRKSRC}/dist/bin/hfsexplorer

do-build:
	@cd ${WRKSRC} && ${SH} buildall

do-install:
	@${MKDIR} ${DATADIR}/lib
	@${MKDIR} ${DATADIR}/res
.for f in hfsx resview unhfs
	cd ${WRKSRC} && ${INSTALL_SCRIPT} dist/bin/${f} ${PREFIX}/bin
.endfor
	cd ${WRKSRC} && ${INSTALL_SCRIPT} dist/bin/hfsexplorer ${PREFIX}/bin/${PORTNAME}
	cd ${WRKSRC} && ${INSTALL_DATA} dist/lib/*.jar ${DATADIR}/lib
	cd ${WRKSRC} && ${INSTALL_DATA} dist/res/icon.png ${DATADIR}/res

do-install-DOCS-on:
	cd ${WRKSRC}/dist/doc && ${COPYTREE_SHARE} html ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
