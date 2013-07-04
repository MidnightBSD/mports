# $MidnightBSD: mports/devel/bouml/Makefile,v 1.6 2011/01/25 14:26:14 laffer1 Exp $

PORTNAME=	bouml
PORTVERSION=	4.22.2
CATEGORIES=	devel
MASTER_SITES=	\
		http://bouml.free.fr/files/
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	Ports@MidnightBSD.org
COMMENT=	BOUML, a free UML 2 modeler
LICENSE=        gpl2

BUILD_DEPENDS=	qmake:${PORTSDIR}/devel/qmake

USE_QT_VER=	3
QTDIR?=		${QT_PREFIX}
ALL_TARGET=	compile
MAKE_ENV=	QMAKESPEC="${LOCALBASE}/share/qt/mkspecs/freebsd-g++"	\
		QTDIR="${QTDIR}"
INSTALLS_ICONS=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION}

PLIST_SUB=	DESKTOPDIR=${DESKTOPDIR:S|^${PREFIX}/||}

pre-configure:
	${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|'	\
		-e 's|%%DESKTOPDIR%%|${DESKTOPDIR}|' ${WRKSRC}/${MAKEFILE}
	${FIND} ${WRKSRC} -name "*.pro" |	\
		${XARGS} ${REINPLACE_CMD} -e '/^CONFIG/s/$$/ thread/'

post-install:
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DATADIR}
	${CHMOD} -R ${SHAREMODE} ${DATADIR}/xmi/*
	${CHMOD} ${SHAREMODE} ${DATADIR}/*.lang
	${FIND} ${DATADIR} -type f -perm 755 | ${XARGS} ${STRIP_CMD}

.include <bsd.port.mk>
