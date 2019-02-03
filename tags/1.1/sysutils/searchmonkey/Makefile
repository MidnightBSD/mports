# $MidnightBSD$
# $FreeBSD: ports/sysutils/searchmonkey/Makefile,v 1.7 2006/12/05 15:12:57 sat Exp $

PORTNAME=	searchmonkey
PORTVERSION=	2.0.0
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	SF/${PORTNAME}/Searchmonkey2/${PORTVERSION}%20%5Bstable%5D
DISTNAME=	${PORTNAME}_v${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Search using regexes for file names and text

LICENSE=	gpl3

USES=		zip
USE_DOS2UNIX=	*.cpp *.h
USE_QT4=	corelib gui moc_build qmake_build rcc_build uic_build

PLIST_FILES=	bin/${PORTNAME}

post-extract: dos2unix

do-configure:
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${QMAKE} ${PORTNAME}_2_0.pro \
		${QMAKEFLAGS})

do-install:
	(cd ${WRKSRC} && ${INSTALL_PROGRAM} ${PORTNAME} ${PREFIX}/bin)

.include <bsd.port.mk>
