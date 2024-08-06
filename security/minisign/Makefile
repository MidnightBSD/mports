PORTNAME=	minisign
PORTVERSION=	0.9
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple tool to sign files and verify signatures

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libsodium.so:security/libsodium

USES=	cmake localbase pkgconfig

CMAKE_OFF=	BUILD_STATIC_EXECUTABLES STATIC_LIBSODIUM

USE_GITHUB=	yes
GH_ACCOUNT=	jedisct1

PLIST_FILES=	bin/minisign share/man/man1/minisign.1.gz

.include <bsd.port.mk>
