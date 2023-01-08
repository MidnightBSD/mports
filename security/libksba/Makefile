PORTNAME=	libksba
PORTVERSION=	1.6.2
CATEGORIES=	security
MASTER_SITES=	GNUPG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to make X.509 certificates
WWW=		https://www.gnupg.org/aegypten2/

LICENSE=	gpl2 gpl3 lgpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING.GPLv2
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING.GPLv3
LICENSE_FILE_lgpl3=	${WRKSRC}/COPYING.LGPLv3

LIB_DEPENDS=	libgpg-error.so:security/libgpg-error

USES=		cpe libtool perl5 tar:bzip2
USE_PERL5=	build

CONFIGURE_ARGS=	--enable-static
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INFO=		ksba

CPE_VENDOR=	libksba_project

.include <bsd.port.mk>
