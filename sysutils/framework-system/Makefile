PORTNAME=	framework-system
DISTVERSIONPREFIX=v
DISTVERSION=	0.6.2
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework Computer System Utility
WWW=		https://github.com/FrameworkComputer/framework-system

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.md

LIB_DEPENDS=	libhidapi.so:comms/hidapi

USES=		cargo

USE_GITHUB=	yes
GH_ACCOUNT=	FrameworkComputer

CARGO_BUILD_ARGS=	-p framework_tool
CARGO_INSTALL_PATH=	framework_tool

PLIST_FILES=	bin/framework_tool

.include <bsd.port.mk>
