# $MidnightBSD$
# $FreeBSD: head/print/cups-fxlinuxprint/Makefile 410825 2016-03-11 11:53:42Z tijl $

PORTNAME=	fxlinuxprint
PORTVERSION=	1.0.1
PORTREVISION=	2
CATEGORIES=	print
MASTER_SITES=	ftp://download.fujixerox.co.jp/pub/exe/apeosport/c4300series/
PKGNAMEPREFIX=	cups-
DISTNAME=	${PORTNAME}-src-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fuji Xerox Printer Driver

LICENSE=	gpl2

LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups

USES=		dos2unix ghostscript:run
DOS2UNIX_FILES=	fxlinuxprint.ppd
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

pre-patch: dos2unix

.include <bsd.port.mk>
