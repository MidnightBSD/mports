PORTNAME=	intellij-fsnotifier
PORTVERSION=	20230112
CATEGORIES=	java devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replacement for IntelliJ's fsnotifier
WWW=		https://gitlab.com/worthwhileit/bsd/fsnotifier

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

LIB_DEPENDS=	libinotify.so:devel/libinotify

USES=	cmake compiler:c11 pkgconfig

USE_GITLAB=	yes
GL_ACCOUNT=	worthwhileit/bsd
GL_PROJECT=	fsnotifier
GL_COMMIT=	b96f269f637058461df482f4cf55037a5968d7a8

PIE_UNSAFE=	yes

CMAKE_ARGS+=	-DVERSION=${PORTVERSION}

PLIST_SUB+=	PORTVERSION=${PORTVERSION}

.include <bsd.port.mk>
