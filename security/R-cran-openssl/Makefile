PORTNAME=	openssl
DISTVERSION=	2.3.3
CATEGORIES=	security
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolkit for Encryption, Signatures and Certificates Based on OpenSSL
WWW=		https://cran.r-project.org/package=openssl

LICENSE=	mit

CRAN_DEPENDS=	R-cran-askpass>0:security/R-cran-askpass
BUILD_DEPENDS=	bash:shells/bash \
		${CRAN_DEPENDS}
RUN_DEPENDS=	${CRAN_DEPENDS}

USES=		cran:auto-plist,compiles shebangfix ssl

SHEBANG_FILES=	${WRKSRC}/tests/google.dk/generate.bash

NO_TEST=	yes

.include <bsd.port.mk>
