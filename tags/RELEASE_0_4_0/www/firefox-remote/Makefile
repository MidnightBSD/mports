# New ports collection makefile for:	firefox-remote
# Date created:				13 May 2004
# Whom:					Franz Klammer <klammer@webonaut.com>
#
# $MidnightBSD: mports/www/firefox-remote/Makefile,v 1.1 2008/06/18 17:37:14 laffer1 Exp $
# $FreeBSD: ports/www/firefox-remote/Makefile,v 1.10 2008/04/19 17:54:06 miwi Exp $
#

PORTNAME=	firefox
PORTVERSION=	20040803
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://www.webonaut.com/distfiles/${PORTNAME}${PKGNAMESUFFIX}/
PKGNAMESUFFIX=	-remote
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper scripts for firefox web browser
LICENSE=	unknown

USE_BZIP2=	yes

UTF8_HACK=	no
FIREFOX_REMOTE=	${PORTNAME}${PKGNAMESUFFIX}
THUNDERBIRD_REMOTE=	thunderbird${PKGNAMESUFFIX}

OPTIONS_DEFINE=	UTF8_LOCALE MENU_FIREFOX MENU_THUNDERBIRD
UTF8_LOCALE_DESC=	Use UTF8 locale (read Makefile for details)
MENU_FIREFOX_DESC=	Add menu entry for firefox
MENU_THUNDERBIRD_DESC=	Add menu entry for thunderbird

.include <bsd.mport.options.mk>

# firefox/thunderbird can't display unicode filenames with special
# characters like umlaute in german correctly if a ISO-locale is set.
# when enabled the remote scripts try to switch to the UTF8-locale if
# available (e.g. de_DE.UTF8 instead of de_DE.ISO8859-xx)
.if ${PORT_OPTIONS:MUTF8_LOCALE}
UTF8_HACK=	yes
.endif

.if ${PORT_OPTIONS:MMENU_FIREFOX}
PLIST_SUB+=	MENU_FIREFOX=""
.else
PLIST_SUB+=	MENU_FIREFOX="@comment "
.endif

.if ${PORT_OPTIONS:MMENU_THUNDERBIRD}
PLIST_SUB+=	MENU_THUNDERBIRD=""
.else
PLIST_SUB+=	MENU_THUNDERBIRD="@comment "
.endif

do-build:
	@${REINPLACE_CMD} -e 's|@X11BASE@|${PREFIX}|g' \
		${WRKSRC}/${FIREFOX_REMOTE}
	@${REINPLACE_CMD} -e 's|@LOCALBASE@|${PREFIX}|g' \
		${WRKSRC}/${FIREFOX_REMOTE}
	@${REINPLACE_CMD} -e 's|@UTF8@|${UTF8_HACK}|g' \
		${WRKSRC}/${FIREFOX_REMOTE}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${FIREFOX_REMOTE} \
		${PREFIX}/bin/${FIREFOX_REMOTE}
	${RM} -f ${PREFIX}/bin/${THUNDERBIRD_REMOTE}
	${LN} -s ${PREFIX}/bin/${FIREFOX_REMOTE} \
		${PREFIX}/bin/${THUNDERBIRD_REMOTE}
.if ${PORT_OPTIONS:MMENU_FIREFOX}
	${INSTALL_DATA} ${WRKSRC}/mozilla_firefox.desktop \
		${LOCALBASE}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/mozilla_firefox.png \
		${LOCALBASE}/share/pixmaps/
.endif
.if ${PORT_OPTIONS:MMENU_THUNDERBIRD}
	${INSTALL_DATA} ${WRKSRC}/mozilla_thunderbird.desktop \
		${LOCALBASE}/share/applications/
	${INSTALL_DATA} ${WRKSRC}/mozilla_thunderbird.png \
		${LOCALBASE}/share/pixmaps/
.endif

.include <bsd.port.mk>
