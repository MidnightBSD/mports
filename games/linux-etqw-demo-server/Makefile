# Created by: ayu <ayunyan@gmail.com>


PORTNAME=	etqw
PORTVERSION=	2.0.r1
CATEGORIES=	games linux
MASTER_SITES=	IDSOFTWARE/etqw
PKGNAMEPREFIX=	linux-
PKGNAMESUFFIX=	-demo-server
DISTNAME=	ETQW-demo2-server-full.r1.x86
EXTRACT_SUFX=	.run

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enemy Territory: QUAKE Wars Demo Server for Linux

LICENSE=	id
LICENSE_NAME=	id software quakewars license
LICENSE_FILE=	${WRKSRC}/data/EULA.txt
LICENSE_PERMS=	

RESTRICTED=	cannot distribute under any means
NO_CDROM=	Redistribution is limited
NO_BUILD=	yes

ONLY_FOR_ARCHS=	i386 amd64
USES=		linux zip:infozip

ETQWDIR=	${PREFIX}/lib/${PORTNAME}${PKGNAMESUFFIX}

OPTIONS_DEFINE=	DOCS

do-extract:
	@${MKDIR} ${WRKSRC}
	@cd ${WRKSRC} && \
		${TAIL} -c +194885 ${_DISTDIR}${DISTNAME}.run > full.zip
	@(cd ${WRKSRC} && ${UNZIP_CMD} -q ${WRKSRC}/full.zip)
	@${RM} ${WRKSRC}/full.zip

post-patch:
	@${SED} -e 's|@ETQWDIR@|${ETQWDIR}|' ${FILESDIR}/etqwded-demo.in > ${WRKSRC}/etqwded-demo

do-install:
	@${MKDIR} ${STAGEDIR}${ETQWDIR}

	${INSTALL_SCRIPT} ${WRKSRC}/etqwded-demo ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/data/etqwded.x86 ${STAGEDIR}${ETQWDIR}
	@cd ${WRKSRC}/data && \
		${FIND} -E . -type f -iregex ".*\.so\.[0-9]+" \
			-exec ${INSTALL_DATA} {} "${STAGEDIR}${ETQWDIR}/{}" \;

	@${MKDIR} ${STAGEDIR}${ETQWDIR}/base/bots
	@cd ${WRKSRC}/data && \
		${FIND} base -type f \
			-exec ${INSTALL_DATA} {} "${STAGEDIR}${ETQWDIR}/{}" \;

	@${MKDIR} ${STAGEDIR}${ETQWDIR}/pb/htm
	@cd ${WRKSRC}/data && \
		${FIND} pb -type f \
			-exec ${INSTALL_DATA} {} "${STAGEDIR}${ETQWDIR}/{}" \;

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for FILE in EULA.txt README.txt copyrights.txt etqwtv.txt pb/PBEULA.txt
	@${INSTALL_DATA} ${WRKSRC}/data/${FILE} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
