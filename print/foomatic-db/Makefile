# $MidnightBSD$

PORTNAME=	db
PORTVERSION=	20160226
CATEGORIES=	print
MASTER_SITES=	FREEBSD_LOCAL/danilo
		
PKGNAMEPREFIX=	foomatic-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${FOOMATICVER}-${PORTVERSION}

MAINTAINER=	danilo@FreeBSD.org
COMMENT=	Database for integrating printer drivers with common spoolers

LICENSE=	gpl2

LIB_DEPENDS=	libxml2.so:${PORTSDIR}/textproc/libxml2 \
		libcurl.so:${PORTSDIR}/ftp/curl

USES=		autoreconf gmake tar:xz
GNU_CONFIGURE=	yes

FOOMATICVER=	4.0
WRKSRC=	${WRKDIR}/${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}
NO_ARCH=	yes

.include <bsd.port.mk>
