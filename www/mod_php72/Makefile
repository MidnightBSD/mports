# $FreeBSD: head/www/mod_php72/Makefile 454302 2017-11-16 10:48:48Z tz $

CATEGORIES=	www devel
PKGNAMEPREFIX=	mod_

MAINTAINER=	ports@FreeBSD.org

PHP_PORT=	lang/php72
MASTERDIR=	${.CURDIR}/../../${PHP_PORT}

OPTIONS_DEFINE=	AP2FILTER
AP2FILTER_DESC=	Use Apache 2.x filter interface (experimental)
OPTIONS_EXCLUDE=CGI CLI FPM EMBED

.include "${MASTERDIR}/Makefile"
