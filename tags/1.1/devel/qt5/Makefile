# $MidnightBSD$
# $FreeBSD: head/devel/qt5/Makefile 416257 2016-06-01 19:10:05Z pi $

PORTNAME=	qt5
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform application and UI framework (metaport)

LICENSE=	gpl3

USE_QT5=	${_USE_QT_ALL:Nphonon4:S/$/_run/} # phonon4 is not part of Qt itself.
USES=		metaport

.include <bsd.port.mk>
