PORTNAME=	tinyxml
PORTVERSION=	2.6.2
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}_${PORTVERSION:S/./_/g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small C++ XML parser
WWW=		https://sourceforge.net/projects/tinyxml/

LICENSE=	zlib

FAKE_OPTS=	trueprefix

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		compiler:c++11-lang cpe uidfix
USE_LDCONFIG=	YES
SHLIB_MAJOR=	3
PLIST_SUB=	SHLIB_MAJOR="${SHLIB_MAJOR}"

CPE_VENDOR=	tinyxml_project

OPTIONS_DEFINE=	DOCS PROFILE
OPTIONS_SUB=	yes

post-patch:
	${MV} ${WRKSRC}/Makefile ${WRKSRC}/Makefile.prev
	@${SED} -e "s=%%SHLIB_MAJOR%%=${SHLIB_MAJOR}=g" \
		${FILESDIR}/Makefile > ${WRKSRC}/Makefile

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/* ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
