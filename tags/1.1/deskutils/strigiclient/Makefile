# $MidnightBSD$

PORTNAME=	strigiclient
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Strigi desktop search: Qt4 GUI

LICENSE=	gpl2

LIB_DEPENDS=	libstreams.so:${PORTSDIR}/deskutils/libstreams \
		libstreamanalyzer.so:${PORTSDIR}/deskutils/libstreamanalyzer \
		libsearchclient.so:${PORTSDIR}/deskutils/strigidaemon

USE_QT4=	corelib gui dbus moc_build uic_build qmake_build rcc_build
USE_LDCONFIG=	yes
USES+=		tar:bzip2

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
