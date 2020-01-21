PORTNAME=	munge
PORTVERSION=	0.5.13
DISTVERSIONPREFIX=	${PORTNAME}-
PORTREVISION=	1
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Authentication service for creating and validating credentials

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	dual

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-openssl-prefix=${OPENSSLBASE}
USES=		libtool pathfix perl5 ssl
USE_LDCONFIG=	yes
USE_RC_SUBR=	munged
INSTALL_TARGET=	install-strip

USE_GITHUB=	yes
GH_ACCOUNT=	dun

.include <bsd.port.mk>
