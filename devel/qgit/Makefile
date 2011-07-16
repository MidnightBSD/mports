#
# $MidnightBSD: mports/devel/qgit/Makefile,v 1.1 2009/04/30 19:15:34 ctriv Exp $
#

PORTNAME=	qgit
PORTVERSION=	2.3
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}4/${PORTVERSION}
PKGNAMESUFFIX=	-qt4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphical interface to git repositories
LICENSE=	gpl2

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib gui moc_build qmake_build rcc_build uic_build
MAKE_JOBS_UNSAFE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/${PORTNAME}

do-configure:
	@cd ${WRKSRC} && ${QMAKE} ${PORTNAME}.pro

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
