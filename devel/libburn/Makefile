# $MidnightBSD$

PORTNAME=	libburn
PORTVERSION=	1.4.8
CATEGORIES=	devel
MASTER_SITES=	http://files.libburnia-project.org/releases/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Libburnia library to read/write optical discs

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	LIBS="-lcam" --program-prefix=""
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
