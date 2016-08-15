# Created by: Thierry Thomas (<thierry@FreeBSD.org>)
# $FreeBSD: head/www/pear-HTTP_Request/Makefile 402439 2015-11-26 12:04:00Z miwi $
# $MidnightBSD$

PORTNAME=	HTTP_Request
PORTVERSION=	1.4.4
CATEGORIES=	www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR classes providing an easy way to perform HTTP requests

BUILD_DEPENDS=	${PEARDIR}/Net/URL.php:${PORTSDIR}/net/pear-Net_URL		\
		${PEARDIR}/Net/Socket.php:${PORTSDIR}/net/pear-Net_Socket
RUN_DEPENDS=	${PEARDIR}/Net/URL.php:${PORTSDIR}/net/pear-Net_URL		\
		${PEARDIR}/Net/Socket.php:${PORTSDIR}/net/pear-Net_Socket

USES=	pear

.include <bsd.port.mk>
