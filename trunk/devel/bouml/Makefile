# $MidnightBSD: mports/devel/bouml/Makefile,v 1.4 2009/12/31 23:49:45 laffer1 Exp $

PORTNAME=	bouml
PORTVERSION=	4.15
CATEGORIES=	devel
MASTER_SITES=	SF \
		http://bouml.free.fr/
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
	${FIND} ${DATADIR} -type f -perm 755 | ${XARGS} ${STRIP_CMD}
	@${ECHO_MSG}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_MSG}

.include <bsd.port.mk>
