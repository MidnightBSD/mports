# $MidnightBSD$

PORTNAME=	libksba
PORTVERSION=	1.3.5
CATEGORIES=	security
MASTER_SITES=	GNUPG/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KSBA is an X.509 Library

LICENSE=	gpl2 gpl3 lgpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING.GPLv2
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING.GPLv3
LICENSE_FILE_lgpl3=	${WRKSRC}/COPYING.LGPLv3

LIB_DEPENDS=	libgpg-error.so:security/libgpg-error

CONFIGURE_ARGS=	--enable-static
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_PERL5=	build
USES=		libtool perl5 tar:bzip2

INFO=		ksba

.include <bsd.port.mk>
