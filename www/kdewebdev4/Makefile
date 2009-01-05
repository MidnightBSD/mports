#
# $MidnightBSD: ports/www/kdewebdev4/Makefile,v 1.66 2008/09/03 13:06:21 miwi Exp $
#

PORTNAME=	kdewebdev
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	www kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Comprehensive html/website development environment
LICENSE=	gpl2

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext
LIB_DEPENDS=	antlr.5:${PORTSDIR}/devel/kdesdk4 \
		tidy-0.99.0:${PORTSDIR}/www/tidy-lib

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_QT_VER=	4
USE_KDE4=	kdelibs kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
QT_COMPONENTS=	opengl gui moc rcc uic

MAN1=		xsldbg.1

post-extract:
	@${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
