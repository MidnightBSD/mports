PORTNAME=	dbskkd-cdb
PORTVERSION=	3.00
PORTREVISION=	0
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SKK dictionary server based on cdb
WWW=		https://github.com/jj1bdx/dbskkd-cdb

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/lib/libcdb.a:databases/tinycdb
RUN_DEPENDS=	${SKKJISYOCDB}:japanese/skk-jisyo-cdb

USE_GITHUB=	yes
GH_ACCOUNT=	jj1bdx
MAKE_ENV=	LOCALBASE="${LOCALBASE}" \
		SKKJISYOCDB="${SKKJISYOCDB}"
PLIST_FILES=	libexec/dbskkd-cdb
SUB_FILES=	pkg-message
PORTDOCS=	${PORTDOCS_FILE} ${PORTDOCS_SH}

SKKDIR?=	share/skk
SKKJISYO_TYPE?=	L
SKKJISYOCDB?=	${LOCALBASE}/${SKKDIR}/SKK-JISYO.${SKKJISYO_TYPE}.cdb
PORTDOCS_FILE=	CHANGES.md LICENSE README.md READMEJP.md \
		examples.md skk-server-protocol.md
PORTDOCS_SH=	makeskkcdb.sh skktocdbm.sh

OPTIONS_DEFINE=	DOCS

post-patch:
.for f in READMEJP.md makeskkcdb.sh
	${REINPLACE_CMD} -e "s!%%PREFIX%%!${PREFIX}!g" \
		-e "s!%%SKKDIR%%!${SKKDIR}!g" \
		-e "s!%%JISYONAME%%!SKK-JISYO.${SKKJISYO_TYPE}!g" ${WRKSRC}/${f}
.endfor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/dbskkd-cdb ${PREFIX}/libexec

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS_FILE:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_SCRIPT} ${PORTDOCS_SH:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
