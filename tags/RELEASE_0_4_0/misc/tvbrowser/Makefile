# $MidnightBSD: mports/misc/tvbrowser/Makefile,v 1.2 2011/05/14 22:34:31 laffer1 Exp $

PORTNAME=	tvbrowser
PORTVERSION=	3.2.1
CATEGORIES=	misc java
MASTER_SITES=	SF/${PORTNAME}/TV-Browser%20Releases%20%28Java%206%20and%20higher%29/${PORTVERSION}/
DISTNAME=	${PORTNAME}_${PORTVERSION}_bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A digital TV guide
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USE_LDCONFIG=	yes
NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.6+
SUB_FILES=	tvbrowser

DESKTOP_ENTRIES="TV-Browser" \
		"A digital TV guide" \
		"${DATADIR}/imgs/tvbrowser128.png" \
		"tvbrowser" \
		"Application;Video;AudioVideo;TV;" \
		true

do-install:
	@cd ${WRKSRC} && ${FIND} . -type d -exec ${MKDIR} "${DATADIR}/{}" \;
	@cd ${WRKSRC} && ${FIND} . -type f -exec ${INSTALL_DATA} "{}" "${DATADIR}/{}" \;
	@${INSTALL_SCRIPT} ${WRKDIR}/tvbrowser ${PREFIX}/bin

.include <bsd.port.mk>
