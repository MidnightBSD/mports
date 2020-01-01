CATEGORIES=	www devel
PKGNAMEPREFIX=	mod_

MAINTAINER=	ports@MidnightBSD.org

PHP_PORT=	lang/php72
MASTERDIR=	${.CURDIR}/../../${PHP_PORT}

OPTIONS_DEFINE=	AP2FILTER
AP2FILTER_DESC=	Use Apache 2.x filter interface (experimental)
OPTIONS_EXCLUDE=CGI CLI FPM EMBED

CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd10.4

.include "${MASTERDIR}/Makefile"
