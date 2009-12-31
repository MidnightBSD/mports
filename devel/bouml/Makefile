# New ports collection makefile for:	bouml
# Date created:		14 June 2005
# Whom:			Thierry Thomas <thierry@pompo.net>
#
# $FreeBSD: ports/devel/bouml/Makefile,v 1.120 2008/05/11 20:20:03 thierry Exp $
# $MidnightBSD: mports/devel/bouml/Makefile,v 1.3 2008/05/26 20:47:52 crash Exp $

PORTNAME=	bouml
PORTVERSION=	4.3.5
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
