#
# $MidnightBSD$
#

PORTNAME=	qgit
PORTVERSION=	2.3
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}4/${PORTVERSION}
PKGNAMESUFFIX=	-qt4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphical interface to git repositories
LICENSE=	gpl2

USES=		qmake tar:bzip2
USE_QT4=	corelib gui moc_build rcc_build uic_build
MAKE_JOBS_UNSAFE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/${PORTNAME}

do-configure:
	@cd ${WRKSRC} && ${QMAKE} ${PORTNAME}.pro

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
