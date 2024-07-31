PORTNAME=	openrasp
PORTVERSION=	1.3.7
DISTVERSIONPREFIX=	v
CATEGORIES=	security java
MASTER_SITES=	https://github.com/baidu/openrasp/releases/download/v${PORTVERSION}/
DISTFILES+=	rasp-java.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Detects vulnerabilities in running applications

LICENSE=	apache2

USE_JAVA=	yes
NO_ARCH=	yes
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/rasp-2022-01-28

do-install:
	${MKDIR} ${PREFIX}/share/openrasp
	(cd ${WRKSRC}/rasp && ${COPYTREE_SHARE} \* ${PREFIX}/share/openrasp)
	#${JAVA} -jar ${WRKSRC}/RaspInstall.jar --install ${PREFIX}/share/openrasp/

.include <bsd.port.mk>
