PORTNAME=	pantomime
PORTVERSION=	1.4.0
PORTREVISION=	1
CATEGORIES=	mail gnustep
MASTER_SITES=	SAVANNAH/gnustep-nonfsf/
DISTNAME=	Pantomime-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail/MIME handling library for GNUstep
WWW=		https://www.nongnu.org/gnustep-nonfsf/gnumail/index.html

LICENSE=	lgpl2.1

# The use of libiconv shouldn't be necessary, but a build dependency installs
# it and we end up picking up the header.
MAKE_ARGS+=	LIBRARIES_DEPEND_UPON='${ICONV_LIB} -lssl'
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM
USES=		gnustep iconv ssl
USE_GNUSTEP=	back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

DEFAULT_LIBVERSION=	1.4

.include <bsd.port.mk>
