PORTNAME=	XMLRPC-Lite
PORTVERSION=	0.717
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client and server side XMLRPC implementation

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-SOAP-Lite>=1.11:net/p5-SOAP-Lite


CONFIGURE_ARGS=	--noprompt
INSTALL_TARGET=	pure_install
USE_PERL5=	configure
USES=		perl5
NO_ARCH=	yes

perl_OLD_CMD=	.*perl

.include <bsd.port.mk>
