# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/multimedia/libquvi-scripts09/Makefile 390224 2015-06-21 13:55:07Z sunpoet $

PORTNAME=	libquvi-scripts
PORTVERSION=	0.9.20131130
PORTREVISION=	1
CATEGORIES=	multimedia devel
MASTER_SITES=	SF/quvi/${PORTVERSION}/${PORTNAME}/ \
		FREEBSD_LOCAL/sunpoet
PKGNAMESUFFIX=	09

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embedded lua scripts for libquvi and utility scripts

LICENSE=	agpl
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	${LUA_PKGNAMEPREFIX}bitop>=1.0.1:devel/lua-bitop@${LUA_FLAVOR} \
		${LUA_PKGNAMEPREFIX}luaexpat>=1.2.0:textproc/luaexpat@${LUA_FLAVOR} \
		${LUA_PKGNAMEPREFIX}json>=1.1.1:converters/lua-json@${LUA_FLAVOR} \
		${LUA_PKGNAMEPREFIX}luasocket>=2.0.2:net/luasocket@${LUA_FLAVOR}

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
