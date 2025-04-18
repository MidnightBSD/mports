PORTNAME=	IO-Socket-SSL
PORTVERSION=	2.089
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to SSL sockets
WWW=		https://metacpan.org/release/IO-Socket-SSL

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/lib/IO/Socket/SSL.pod

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Net-SSLeay>=1.59:security/p5-Net-SSLeay \
		p5-Mozilla-CA>=20130114:www/p5-Mozilla-CA

NO_ARCH=	yes
USES=		perl5 shebangfix
USE_PERL5=	configure

CONFIGURE_ENV=	NO_NETWORK_TESTING=yes

NO_TEST=	yes

OPTIONS_DEFINE=	EXAMPLES IDN IPV6

INSTALL_TARGET=	pure_install

PORTEXAMPLES=	*

SHEBANG_FILES=	example/ssl_mitm.pl

IDN_BUILD_DEPENDS=	p5-URI>=1.50:net/p5-URI
IDN_RUN_DEPENDS=	${IDN_BUILD_DEPENDS}
IPV6_RUN_DEPENDS=	p5-IO-Socket-IP>0:net/p5-IO-Socket-IP

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	${INSTALL_SCRIPT} ${WRKSRC}/example/* ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
