PORTNAME=	cos
PORTVERSION=	2002.11.05
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	java devel
MASTER_SITES=	http://www.servlets.com/cos/ \
		http://www.oreilly.com.tw/bookcode/
DISTNAME=	${PORTNAME}-05Nov2002

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The O\'Reilly package of utility classes for servlet developers
WWW=		http://www.servlets.com/cos/index.html

LICENSE=	cos
LICENSE_NAME=	cos
LICENSE_TEXT=	Special conditions apply for commercial use, see licence
LICENSE_PERMS=	auto-accept

USES=		zip
NO_WRKSUBDIR=	yes
USE_JAVA=	yes
NO_BUILD=	yes
DATAFILES=	readme.txt license.txt doc
DATADIR=	${JAVASHAREDIR}/${PORTNAME}

do-install:
	@${INSTALL_DATA} ${WRKSRC}/lib/cos.jar ${JAVAJARDIR}/
	@cd ${WRKSRC} \
	  && ${FIND} ${DATAFILES} -type d -exec ${MKDIR} ${DATADIR}/{} \; \
	  && ${FIND} ${DATAFILES} -type f -exec ${INSTALL_DATA} {} ${DATADIR}/{} \;
	@${INSTALL_DATA} ${WRKSRC}/upload.war ${DATADIR}/doc

.include <bsd.port.mk>
