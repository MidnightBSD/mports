# $MidnightBSD$

PORTNAME=	bsdconv
PORTVERSION=	11.3.1
CATEGORIES=	converters

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BSD licensed charset/encoding converter library

LICENSE=	iscl

USE_GITHUB=	yes
GH_ACCOUNT=	buganini

OPTIONS_DEFINE=	CHINESE EBCDIC
OPTIONS_SUB=	yes
CHINESE_DESC=	Extra Chinese codecs
EBCDIC_DESC=	EBCDIC codecs

ALL_TARGET=	libbsdconv bsdconv-mktable meta bsdconv-man bsdconv-completion bsdconv filters scorers codecs_basic
INSTALL_TARGET=	installdir install_main install_filters install_scorers install_basic
MAKE_ARGS=	PREFIX=${PREFIX} STRIP=${STRIP}
USE_LDCONFIG=	yes

CHINESE_ALL_TARGET=	codecs_chinese
CHINESE_INSTALL_TARGET=	install_chinese
EBCDIC_ALL_TARGET=	codecs_ebcdic
EBCDIC_INSTALL_TARGET=	install_ebcdic

.include <bsd.port.mk>
