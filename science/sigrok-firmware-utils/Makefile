PORTNAME=	firmware
PORTVERSION=	20140418
PORTREVISION=	3
CATEGORIES=	science
MASTER_SITES=	#none
PKGNAMEPREFIX=	sigrok-
PKGNAMESUFFIX=	-utils
DISTFILES=	#none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sigrok firmware extraction utilities
WWW=		https://www.sigrok.org/wiki/Firmware

LICENSE=	gpl2

USES=		python shebangfix
SHEBANG_FILES=	${PY_FILES} ${EX_FILES}
NO_BUILD=	yes
NO_ARCH=	yes

PORTDOCS=	README.parsepe

PY_FILES=	parsepe.py parseelf.py

EX_FILES=	sigrok-fwextract-hantek-dso \
		sigrok-fwextract-saleae-logic16 \
		sigrok-fwextract-sysclk-lwla

PLIST_FILES=	${PY_FILES:S,^,bin/,} \
		${EX_FILES:S,^,bin/,} \
		${EX_FILES:S,^,share/man/man1/,:S,$,.1.gz,}

OPTIONS_DEFINE=	DOCS

do-extract:
	@${MKDIR} ${WRKSRC}
	@${CP} ${FILESDIR}/* ${WRKSRC}

do-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.parsepe ${STAGEDIR}${DOCSDIR}
.for fil in ${PY_FILES}
	${INSTALL_SCRIPT} ${WRKSRC}/${fil} ${STAGEDIR}${PREFIX}/bin
.endfor
.for fil in ${EX_FILES}
	${INSTALL_SCRIPT} ${WRKSRC}/${fil} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${fil}.1 ${STAGEDIR}${PREFIX}/share/man/man1
.endfor

.include <bsd.port.mk>
