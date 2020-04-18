# $FreeBSD: head/www/mod_php74/Makefile 512406 2019-09-20 12:21:11Z tz $

CATEGORIES=	www devel
PKGNAMEPREFIX=	mod_

MAINTAINER=	ports@FreeBSD.org

PHP_PORT=	lang/php74
MASTERDIR=	${.CURDIR}/../../${PHP_PORT}

OPTIONS_DEFINE=	AP2FILTER
AP2FILTER_DESC=	Use Apache 2.x filter interface (experimental)
OPTIONS_EXCLUDE=CGI CLI FPM EMBED

.include "${MASTERDIR}/Makefile"
