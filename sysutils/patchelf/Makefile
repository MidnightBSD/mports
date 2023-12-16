PORTNAME=	patchelf
DISTVERSION=	0.14.3
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/NixOS/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to modify the dynamic linker
WWW=		https://github.com/NixOS/patchelf

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf compiler:c++11-lang gmake tar:bz2

GNU_CONFIGURE=	yes
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

.include <bsd.port.mk>
