# New ports collection makefile for:    javajj
# Date created:		January 3, 2008
# Whom:			Lucas Holt
#
# $MidnightBSD: mports/deskutils/javajj/Makefile,v 1.1 2009/01/04 08:08:25 laffer1 Exp $

PORTNAME=	javajj
PORTVERSION=	1.0
CATEGORIES=	deskutils java
MASTER_SITES=	http://www.justjournal.com/software/
DISTFILES=	justjournal-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Just Journal for Java blogging app
LICENSE=	unknown

MAKE_ARGS=	-quiet -noinput
USE_BZIP2=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.4+
USE_ANT=	yes

WRKSRC=		${WRKDIR}/justjournal-${PORTVERSION}/java_jjclient

SUB_FILES=	${PORTNAME}.sh
PLIST_FILES+=	bin/${PORTNAME}
PLIST_FILES+=	%%JAVAJARDIR%%/javajj.jar

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${PREFIX}/bin/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/dist/javajj.jar ${JAVAJARDIR}/

.include <bsd.port.mk>
