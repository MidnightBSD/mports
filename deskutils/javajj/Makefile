# Whom:			Lucas Holt
# $MidnightBSD$

PORTNAME=	javajj
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	deskutils java
MASTER_SITES=	http://www.justjournal.com/software/
DISTFILES=	justjournal-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Just Journal for Java blogging app

LICENSE=	unknown

MAKE_ARGS=	-quiet -noinput
USES=		tar:bzip2
USE_JAVA=	yes
JAVA_VERSION=	1.6+
USE_ANT=	yes

WRKSRC=		${WRKDIR}/justjournal-${PORTVERSION}/java_jjclient

SUB_FILES=	${PORTNAME}.sh
PLIST_FILES+=	bin/${PORTNAME}
PLIST_FILES+=	%%JAVAJARDIR%%/javajj.jar

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/dist/javajj.jar ${JAVAJARDIR}/

.include <bsd.port.mk>
