# $MidnightBSD: mports/net/hupnp/Makefile,v 1.1 2011/07/31 16:52:56 laffer1 Exp $
# $FreeBSD: ports/net/hupnp/Makefile,v 1.1 2011/02/05 16:16:13 fluffy Exp $

PORTNAME=	hupnp
PORTVERSION=	1.0.0
CATEGORIES=	net devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}
DISTNAME=	herqq-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for building UPnP devices and control points
LICENSE=	gpl3

USE_ZIP=	yes
USE_GMAKE=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib network xml dbus gui \
		qmake_build moc_build rcc_build uic_build
QMAKE_ARGS=	PREFIX=${PREFIX} herqq.pro

do-configure:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${QMAKE} ${QMAKEFLAGS} ${QMAKE_ARGS} ${FAKE_MAKEARGS}

.include <bsd.port.mk>
