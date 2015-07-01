# $MidnightBSD$
# $FreeBSD: ports/net/hupnp/Makefile,v 1.1 2011/02/05 16:16:13 fluffy Exp $

PORTNAME=	hupnp
PORTVERSION=	1.0.0
PORTREVISION=	2
CATEGORIES=	net devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}
DISTNAME=	herqq-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for building UPnP devices and control points

LICENSE=	gpl3

USES=		gmake qmake zip
USE_QT4=	corelib network xml dbus gui \
		moc_build rcc_build uic_build

QMAKE_ARGS=	"CONFIG+=DISABLE_AVTESTAPP DISABLE_TESTAPP"

.include <bsd.port.mk>
