# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/multimedia/libquvi-scripts09/Makefile 390224 2015-06-21 13:55:07Z sunpoet $

PORTNAME=	libquvi-scripts
PORTVERSION=	0.9.20131130
CATEGORIES=	multimedia devel
MASTER_SITES=	SF/quvi/${PORTVERSION}/${PORTNAME}/
PKGNAMESUFFIX=	09

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embedded lua scripts for libquvi and utility scripts

LICENSE=	agpl

OPTIONS_DEFINE=	NSFW
OPTIONS_SUB=	yes
NSFW_DESC=	Enable adult website support

CONFIGURE_ARGS=	--program-suffix=${PKGNAMESUFFIX}
GNU_CONFIGURE=	yes
NO_ARCH=	yes
USES=		lua:run pathfix tar:xz

PLIST_SUB=	PKGNAMESUFFIX=${PKGNAMESUFFIX} PORTVERSION=${PORTVERSION} QUVIVERSION=${PORTVERSION:R}

NSFW_CONFIGURE_WITH=	nsfw

.include <bsd.port.mk>
