PORTNAME=	uchardet
DISTVERSION=	0.0.8
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	https://www.freedesktop.org/software/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal charset detection library
WWW=		https://www.freedesktop.org/wiki/Software/uchardet/

LICENSE=	gpl2 lgpl2.1 mpl
LICENSE_COMB=	dual

USES=		cmake compiler:c++11-lang pathfix tar:xz
USE_LDCONFIG=	yes



CMAKE_ARGS=	-DTARGET_ARCHITECTURE=NONE -DCMAKE_INSTALL_MANDIR:PATH=${PREFIX}/share/man

.if defined(WITH_DEBUG)
PLIST_SUB+=	VERSION_SUFFIX=".debug"
.else
PLIST_SUB+=	VERSION_SUFFIX=""
.endif

.include <bsd.port.mk>
