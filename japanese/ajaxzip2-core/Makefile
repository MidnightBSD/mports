PORTNAME=	ajaxzip2
PORTVERSION=	20081102
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	FREEBSD_LOCAL/kuriyama
PKGNAMESUFFIX=	-core
DISTNAME=	${PORTNAME}-${PORTVERSION}${PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ajaxzip2 (Japanese ZIP code utility) core scripts
WWW=		https://www.kawa.net/works/ajax/ajaxzip2/ajaxzip2.html

LICENSE=	NONE

USES=		dos2unix shebangfix zip
WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	YES
SHEBANG_FILES=	work/csv2jsonzip.pl

do-install:
	${MKDIR} ${WWWDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/ajaxzip2.js ${WWWDIR}/
	${INSTALL_SCRIPT} ${WRKSRC}/work/csv2jsonzip.pl ${DATADIR}/

.include <bsd.port.mk>
