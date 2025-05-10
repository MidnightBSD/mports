PORTNAME=	bluej
PORTVERSION=	3.1.7
CATEGORIES=	java editors
MASTER_SITES=	http://www.bluej.org/download/files/ \
		ftp://ftp.bluej.org/pub/bluej/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.//g}
EXTRACT_SUFX=	.jar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrated Java environment designed for introductory teaching
WWW=		https://www.bluej.org/

LICENSE=	gpl2 cddl mit bsd3
LICENSE_COMB=	multi

NO_BUILD=	yes

USES=		java
JAVA_VERSION=	8+
SUB_FILES=	bluej

post-extract:
	@${MKDIR} ${WRKSRC}
	@${TAR} -xf ${WRKDIR}/bluej-dist.jar -C ${WRKSRC}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/bluej
	cd ${WRKSRC}; ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/bluej
	${INSTALL_SCRIPT} ${WRKDIR}/bluej ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
