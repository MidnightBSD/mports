PORTNAME=	jrdesktop
PORTVERSION=	0.3.1.0
CATEGORIES=	net java
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION:R:R}/
DISTNAME=	${PORTNAME}-${PORTVERSION}.jar
EXTRACT_SUFX=
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	View and/or control a remote PC
 WWW=		http://jrdesktop.sourceforge.net/

LICENSE=	gpl3

USE_JAVA=	yes
NO_BUILD=	yes

SUB_FILES=	jrdesktop
SUB_LIST+=	JAVA=${JAVA} \
		PORTNAME=${PORTNAME} \
		PORTVERSION=${PORTVERSION}

PLIST_FILES=	${JAVAJARDIR:S/${PREFIX}\///}/${DISTNAME} \
		bin/${PORTNAME}

post-extract:
	${CP} ${DISTDIR}/${DISTNAME} ${WRKDIR}

do-install:
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME} ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/jrdesktop ${STAGEDIR}${PREFIX}/bin/jrdesktop

.include <bsd.port.mk>
