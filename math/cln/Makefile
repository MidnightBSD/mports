PORTNAME=	cln
PORTVERSION=	1.3.6
CATEGORIES=	math devel
MASTER_SITES=	http://www.ginac.de/CLN/ \
		http://www.mirrors.wiretapped.net/security/cryptography/libraries/math/cln/ \
		ftp://ftpthep.physik.uni-mainz.de/pub/gnu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Class Library for Numbers

LICENSE=	gpl2

LIB_DEPENDS=	libgmp.so:math/gmp

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gmp=${LOCALBASE}
INSTALL_TARGET=	install-strip
USES=		gmake libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes

INFO=		cln

BROKEN_sparc64=	Does not compile on sparc64

.include <bsd.port.mk>
