# $MidnightBSD$
# $FreeBSD: head/x11-themes/kde4-icons-oxygen/Makefile 415902 2016-05-26 16:25:39Z swills $

PORTNAME=	oxygen
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11-themes 
MASTER_SITES=	KDE/${KDE4_BRANCH}/${PORTVERSION}/src
PKGNAMEPREFIX=	kde4-icons-
DISTNAME=	${PORTNAME}-icons-${PORTVERSION}
DIST_SUBDIR=	KDE/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Oxygen icon theme for KDE

LICENSE=	unknown

USE_KDE4=	# blank, needed to get KDE4_VERSION
USES=		cmake:outsource tar:xz
INSTALL_TARGET=	install
EXTRACT_AFTER_ARGS=	--exclude '${DISTNAME}/scalable'

.include <bsd.port.mk>
