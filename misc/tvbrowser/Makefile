PORTNAME=	tvbrowser
PORTVERSION=	4.2.7
CATEGORIES=	misc java
MASTER_SITES=	SF/${PORTNAME}/TV-Browser%20Releases%20%28Java%2011%20and%20higher%29/${PORTVERSION}/
DISTNAME=	${PORTNAME}_${PORTVERSION}_bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Digital TV and radio guide
WWW=		https://www.tvbrowser.org

LICENSE=	gpl3

USES=		java
JAVA_VERSION=	11+

NO_BUILD=	yes
SUB_FILES=	tvbrowser

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

do-install:
	@${REINPLACE_CMD} -e "s/${PORTNAME}\.sh/${PORTNAME}/" \
		${WRKSRC}/${PORTNAME}.desktop
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.desktop \
		${STAGEDIR}${PREFIX}/share/applications/
	@${RM} ${WRKSRC}/${PORTNAME}.desktop ${WRKSRC}/${PORTNAME}.desktop.bak
	@cd ${WRKSRC} && ${FIND} . -type d -exec \
		${MKDIR} "${STAGEDIR}${DATADIR}/{}" \;
	@cd ${WRKSRC} && ${FIND} . -type f -exec \
		${INSTALL_DATA} {} "${STAGEDIR}${DATADIR}/{}" \;
	${INSTALL_SCRIPT} ${WRKDIR}/tvbrowser ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
