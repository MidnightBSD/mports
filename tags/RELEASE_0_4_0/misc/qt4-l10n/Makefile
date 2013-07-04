# $MidnightBSD: mports/misc/qt4-l10n/Makefile,v 1.2 2011/07/23 23:42:19 laffer1 Exp $
# $FreeBSD: ports/misc/qt4-l10n/Makefile,v 1.7 2010/12/02 19:47:12 makc Exp $

PORTNAME=	l10n
DISTVERSION=	${QT4_VERSION}
CATEGORIES?=	misc
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt translations messages
LICENSE=	gpl3

USE_QT4=	linguist_build
QT_DIST=	yes
QT_NONSTANDARD=	yes

EXTRACT_AFTER_ARGS+=	--include '${DISTNAME}/translations'

do-build:
	${LOCALBASE}/bin/lrelease-qt4 ${WRKSRC}/translations/*.ts

do-install:
	${MKDIR} ${PREFIX}/share/qt4/translations
	${INSTALL_DATA} ${WRKSRC}/translations/*.qm ${PREFIX}/share/qt4/translations

.include <bsd.port.mk>
