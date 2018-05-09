# $MidnightBSD$
# $FreeBSD: head/x11/qt5-qev/Makefile 372179 2014-11-05 09:39:21Z rakuco $

PORTNAME=	qev
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt QWidget events introspection tool

LICENSE=	gpl3

USE_QT5=	core widgets
QT_DIST=	tools
USES=		qmake

WRKSRC=	${WRKDIR}/qttools-opensource-src-${QT5_VERSION}/src/${PORTNAME}

# qev is not connected to qttool's build system, so we cannot just run qmake
# and set {BUILD,INSTALL}_WRKSRC.
# Instead, we run qmake from src/${PORTNAME} but need to copy .qmake.conf to
# it for all required variables to be set (MODULE_VERSION etc).
post-patch:
	${CP} ${WRKSRC}/../../.qmake.conf ${WRKSRC}

.include <bsd.port.mk>
