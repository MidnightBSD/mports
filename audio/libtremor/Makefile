# Created by: kwm@rainbow-runner.nl

PORTNAME=	libtremor
PORTVERSION=	1.2.1.s20150105
CATEGORIES=	audio
MASTER_SITES=	http://git.xiph.org/?p=tremor.git;a=snapshot;sf=tgz;h=${GIT_COMMIT};/
DISTNAME=	${PORTNAME:S/lib//}-${GIT_COMMIT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integer-only fully Ogg Vorbis compliant decoder library

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:audio/libogg

GIT_COMMIT=	b56ffc
USES=		autoreconf libtool pathfix pkgconfig
PATHFIX_MAKEFILEIN=	Makefile.am
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
