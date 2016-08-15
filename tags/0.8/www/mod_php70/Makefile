# Created by:	marcus@FreeBSD.org
# $FreeBSD: head/www/mod_php70/Makefile 408932 2016-02-15 14:34:26Z miwi $
# $MidnightBSD$

CATEGORIES=	www devel
PKGNAMEPREFIX=	mod_

MAINTAINER=	ports@MidnightBSD.org

PHP_PORT=	lang/php70
MASTERDIR=	${.CURDIR}/../../${PHP_PORT}

OPTIONS_DEFINE=	AP2FILTER
AP2FILTER_DESC=	Use Apache 2.x filter interface (experimental)
OPTIONS_EXCLUDE=	CGI CLI FPM EMBED

.include "${MASTERDIR}/Makefile"
