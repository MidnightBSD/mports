# $MidnightBSD: mports/sysutils/searchmonkey/Makefile,v 1.3 2010/01/02 22:37:31 laffer1 Exp $
# $FreeBSD: ports/sysutils/searchmonkey/Makefile,v 1.7 2006/12/05 15:12:57 sat Exp $

PORTNAME=	searchmonkey
PORTVERSION=	2.0.0
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}/Searchmonkey2/${PORTVERSION}%20%5Bstable%5D
DISTNAME=	${PORTNAME}_v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Search using regexes for file names and text
LICENSE=	lgpl

USE_ZIP=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib gui moc_build qmake_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/${PORTNAME}

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${QMAKE} ${PORTNAME}_2_0.pro \
		-spec ${QMAKESPEC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
