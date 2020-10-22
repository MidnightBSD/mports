# Created by: Yuri Victorovich <yuri@rawbw.com>

PORTNAME=	uchardet
DISTVERSION=	0.0.7
CATEGORIES=	textproc
MASTER_SITES=	https://www.freedesktop.org/software/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal charset detection library

LICENSE=	gpl2 lgpl2.1 mpl
LICENSE_COMB=	dual

USES=		cmake compiler:c++11-lang pathfix tar:xz
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DCMAKE_INSTALL_MANDIR:PATH=${MANPREFIX}/man

.if defined(WITH_DEBUG)
PLIST_SUB+=	VERSION_SUFFIX=".debug"
.else
PLIST_SUB+=	VERSION_SUFFIX=""
.endif

.include <bsd.port.mk>
