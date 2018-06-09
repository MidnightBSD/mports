# Created by: Nicola Vitale <nivit@FreeBSD.org>
# $FreeBSD: head/audio/libechonest/Makefile 435573 2017-03-06 23:50:09Z jhale $
# $MidnightBSD$

PORTNAME=	libechonest
PORTVERSION=	2.3.1
PORTREVISION=	1
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of C++/Qt classes designed to use the APIs of The Echo Nest

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libqjson.so:devel/qjson

GH_ACCOUNT=	lfranchi

OPTIONS_DEFINE=	TEST

PLIST_SUB=	PORTVERSION=${PORTVERSION}

TEST_CMAKE_BOOL=ECHONEST_BUILD_TESTS
TEST_USE=	qt4=qtestlib_build,xml_build

USES=		cmake pkgconfig
USE_GITHUB=	yes
USE_LDCONFIG=	yes
USE_QT4=	corelib qmake_build moc_build network rcc_build

.include <bsd.port.mk>
