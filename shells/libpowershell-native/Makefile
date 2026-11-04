PORTNAME=	libpowershell-native
DISTVERSIONPREFIX=v
DISTVERSION=	7.4.0
CATEGORIES=	shells devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Support library for PowerShell
WWW=		https://microsoft.com/PowerShell

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake

USE_GITHUB=	yes
GH_ACCOUNT=	PowerShell
GH_PROJECT=	PowerShell-Native

CMAKE_SOURCE_PATH=	${WRKSRC}/src/libpsl-native

PLIST_FILES=	lib/powershell/libpsl-native.so

do-install:
	@${MKDIR} ${PREFIX}/lib/powershell
	${INSTALL_LIB} ${WRKSRC}/src/powershell-unix/libpsl-native.so \
		${PREFIX}/lib/powershell

.include <bsd.port.mk>
