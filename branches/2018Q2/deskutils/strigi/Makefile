# $MidnightBSD$

PORTNAME=	strigi
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
DISTFILES=      #

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Strigi desktop search (meta port)

LICENSE=	gpl2

USE_KDE4=	strigi_run
NO_BUILD=	yes

OPTIONS_DEFINE=	CLIENT DAEMON UTILITIES
OPTIONS_DEFAULT=	${OPTIONS_DEFINE}

.include <${.CURDIR}/Makefile.common>
.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCLIENT}
RUN_DEPENDS+=	${LOCALBASE}/bin/strigiclient:${PORTSDIR}/deskutils/strigiclient
.endif

.if ${PORT_OPTIONS:MDAEMON}
RUN_DEPENDS+=	${LOCALBASE}/bin/strigidaemon:${PORTSDIR}/deskutils/strigidaemon
.endif

.if ${PORT_OPTIONS:MUTILITIES}
RUN_DEPENDS+=	${LOCALBASE}/bin/xmlindexer:${PORTSDIR}/deskutils/strigiutils
.endif

do-patch:
	@${DO_NADA}

do-install:
	@${DO_NADA}

.include <bsd.port.mk>
