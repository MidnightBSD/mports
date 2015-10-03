# $MidnightBSD$
# $FreeBSD: head/audio/mpdcon/Makefile 386312 2015-05-14 10:15:04Z mat $

PORTNAME=	mpdcon
PORTVERSION=	1.5.1
CATEGORIES=	audio gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	MPDCon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPD client for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	base gui back build

LIB_DEPENDS=	libmpdclient.so.2:${PORTSDIR}/audio/libmpdclient \
		libSQLClient.so:${PORTSDIR}/databases/sqlclient

post-patch:
	${REINPLACE_CMD} -e \
		's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
			${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
