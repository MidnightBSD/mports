PORTNAME=	FreeWnn
PORTVERSION=	1.1.1.a021
PORTREVISION=	15
CATEGORIES?=	japanese
MASTER_SITES=	OSDN/freewnn
PKGNAMESUFFIX=	-server
DISTNAME=	${PORTNAME}-1.1.1-a021

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Japanese/Chinese/Korean input method (Japanese server)
WWW=		http://freewnn.osdn.jp/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

OPTIONS_DEFAULT?=	WNN SERVER
MANLANG?=		ja
USERS=			wnn

.include "${.CURDIR}/../../japanese/FreeWnn-lib/Makefile.common"

WNN_LIB_DEPENDS+=	libwnn.so:japanese/FreeWnn-lib
WNN_CONFIGURE_ON+=	--with-libwnn=-lwnn \
			--with-wnn-libraries="${PREFIX}/lib"
WNN_USE=	RC_SUBR=wnn

CWNN_LIB_DEPENDS+=	libcwnn.so:chinese/FreeWnn-lib
CWNN_CONFIGURE_ON+=	--with-libcwnn=-lcwnn \
			--with-cwnn-libraries="${PREFIX}/lib"
CWNN_USE=	RC_SUBR=cwnn RC_SUBR=twnn

KWNN_LIB_DEPENDS+=	libkwnn.so:korean/FreeWnn-lib
KWNN_CONFIGURE_ON+=	--with-libkwnn=-lkwnn \
			--with-kwnn-libraries="${PREFIX}/lib"
KWNN_USE=	RC_SUBR=kwnn

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=int-conversion
CFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
