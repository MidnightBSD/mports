# $MidnightBSD$
# $FreeBSD: ports/mail/p5-Mail-DKIM/Makefile,v 1.7 2007/03/16 20:58:23 miwi Exp $

PORTNAME=	Mail-DKIM
PORTVERSION=	0.40
PORTREVISION=	3
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN \
		http://jason.long.name/dkimproxy/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to process and/or create DKIM email

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Crypt-OpenSSL-RSA>=0:${PORTSDIR}/security/p5-Crypt-OpenSSL-RSA \
		p5-Mail-Tools>=0:${PORTSDIR}/mail/p5-Mail-Tools \
		p5-Net-DNS>=0:${PORTSDIR}/dns/p5-Net-DNS
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5 shebangfix
USE_PERL5=	configure
PERL_CONFIGURE=	yes
SHEBANG_FILES=	scripts/dkim*.pl sample_mime_lite.pl
NO_ARCH=	yes

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/dkim*.pl ${PREFIX}/bin

.include <bsd.port.mk>
