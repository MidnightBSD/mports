# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/graphics/cenon/Makefile 383626 2015-04-09 07:44:41Z bapt $

PORTNAME=	cenon
PORTVERSION=	4.0.2
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://www.vhf-group.com/vhf-interservice/download/source/
DISTNAME=	Cenon-${MAINVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vector graphics tool for GNUstep

LICENSE=	other

USES=	tar:bzip2 gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Cenon
MAINVERSION=	4.0.2
FULLVERSION=	4.0.0
CENON_LIB_DIR=	${GNUSTEP_LOCAL_ROOT}/Library/Cenon

OPTIONS_DEFINE=	FULL_LIBRARY
FULL_LIBRARY_DESC=	Install complete Cenon Library

.include <bsd.mport.options.mk>

DISTFILES+=	CenonLibrary-${FULLVERSION}-1${EXTRACT_SUFX}

pre-install:
	${MKDIR} ${FAKE_DESTDIR}${GNUSTEP_LOCAL_ROOT}/Library/
	${TAR} -xyvf ${_DISTDIR}/CenonLibrary-${FULLVERSION}-1${EXTRACT_SUFX} \
		-C ${FAKE_DESTDIR}${GNUSTEP_LOCAL_ROOT}/Library/ \
		--exclude COPYING --exclude '._*'

.include <bsd.port.mk>
