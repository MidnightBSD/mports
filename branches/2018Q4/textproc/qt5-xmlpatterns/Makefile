# $MidnightBSD$
# $FreeBSD: head/textproc/qt5-xmlpatterns/Makefile 413746 2016-04-21 16:43:14Z swills $

PORTNAME=	xmlpatterns
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt support for XPath, XQuery, XSLT and XML Schema

LICENSE=	gpl3

USE_QT5=	core network buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
