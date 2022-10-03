PORTNAME=	Mail-DKIM
PORTVERSION=	1.20220520
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN \
		http://jason.long.name/dkimproxy/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to process and/or create DKIM email
WWW=		http://jason.long.name/dkimproxy/

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Crypt-OpenSSL-RSA>=0:security/p5-Crypt-OpenSSL-RSA \
		p5-Mail-AuthenticationResults>=0:mail/p5-Mail-AuthenticationResults \
		p5-Mail-Tools>=0:mail/p5-Mail-Tools \
		p5-Net-DNS>=0:dns/p5-Net-DNS

USES=		perl5 shebangfix
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

SHEBANG_FILES=	scripts/*.pl

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/dkim*.pl ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
