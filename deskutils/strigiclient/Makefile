# $MidnightBSD$

PORTNAME=	strigiclient
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Strigi desktop search: Qt4 GUI

LICENSE=	gpl2

LIB_DEPENDS=	streams:${PORTSDIR}/deskutils/libstreams \
		streamanalyzer:${PORTSDIR}/deskutils/libstreamanalyzer \
		searchclient:${PORTSDIR}/deskutils/strigidaemon

USE_QT4=	corelib gui dbus moc_build uic_build qmake_build rcc_build
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
