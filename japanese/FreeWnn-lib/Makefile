PORTNAME=	FreeWnn
PORTVERSION=	1.1.1.a021
PORTREVISION=	15
CATEGORIES?=	japanese
MASTER_SITES=	OSDN/freewnn
PKGNAMESUFFIX=	-lib
DISTNAME=	${PORTNAME}-1.1.1-a021

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Japanese/Chinese/Korean input method (Japanese client libraries)
WWW=		http://freewnn.osdn.jp/

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

USE_LDCONFIG=	yes

OPTIONS_DEFAULT?=	LIB WNN
MANLANG?=		ja

.include "${.CURDIR}/../../japanese/FreeWnn-lib/Makefile.common"
.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
