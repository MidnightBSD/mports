# $MidnightBSD$
# $FreeBSD: ports/net/cagibi/Makefile,v 1.3 2011/10/16 22:58:10 avilla Exp $

PORTNAME=	cagibi
PORTVERSION=	0.2.0
CATEGORIES=	net devel
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/cagibi

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE SSDP/uPNP proxy
LICENSE=	gpl2

USE_BZIP2=	yes
USE_CMAKE=	yes
USE_KDE4=	automoc4
USE_QT_VER=	4
QT_COMPONENTS=	corelib network xml dbus \
		qmake_build moc_build rcc_build uic_build

.include <bsd.port.mk>
