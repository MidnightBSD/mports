# Created by: Matt Tosto <datahead4@gmail.com>
# $FreeBSD: head/audio/liblastfm/Makefile 430702 2017-01-06 11:09:18Z jhale $
# $MidnightBSD$

PORTNAME=	liblastfm
PORTVERSION=	1.0.9
PORTREVISION=	1
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt C++ library for the Last.fm webservices

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	lastfm

USES=		cmake pkgconfig
USE_LDCONFIG=	yes
USE_QT4=	corelib dbus network sql xml \
		moc_build qmake_build rcc_build

CMAKE_ARGS=	-DBUILD_WITH_QT4:BOOL=ON

OPTIONS_DEFINE=		FINGERPRINT
OPTIONS_DEFAULT=	FINGERPRINT
OPTIONS_SUB=		yes

FINGERPRINT_DESC=	Build the lastfm-fingerprint library
FINGERPRINT_LIB_DEPENDS=libsamplerate.so:audio/libsamplerate \
			libfftw3f.so:math/fftw3-float
FINGERPRINT_CMAKE_BOOL=	BUILD_FINGERPRINT
# We only need fftw3.h from math/fftw3; no need to install
FINGERPRINT_BUILD_DEPENDS=	${NONEXISTENT}:math/fftw3:patch
FINGERPRINT_CMAKE_ON=	-DLIBFFTW3_INCLUDE_DIR:PATH=`${MAKE} -C ${PORTSDIR}/math/fftw3 -VWRKSRC`/api

NO_TEST=	yes

.include <bsd.port.mk>
