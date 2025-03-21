PORTNAME=	Mail-DMARC
PORTVERSION=	1.20240314
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to process and/or create DKIM email
WWW=		https://github.com/msimerson/mail-dmarc

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Crypt-OpenSSL-RSA>=0:security/p5-Crypt-OpenSSL-RSA \
		p5-Regexp-Common>=0:textproc/p5-Regexp-Common \
		p5-Config-Tiny>=0:devel/p5-Config-Tiny \
		p5-File-ShareDir-Install>=0:devel/p5-File-ShareDir-Install \
		p5-Net-IP>=0:net-mgmt/p5-Net-IP \
		p5-Socket6>=0:net/p5-Socket6 \
		p5-Email-MIME>=0:mail/p5-Email-MIME \
		p5-HTTP-Message>=0:www/p5-HTTP-Message \
		p5-HTTP-Tiny>=0:www/p5-HTTP-Tiny \
		p5-IO-Socket-SSL>=0:security/p5-IO-Socket-SSL \
		p5-JSON>=0:converters/p5-JSON \
		p5-Net-SMTPS>=0:mail/p5-Net-SMTPS \
		p5-Net-SSLeay>=0:security/p5-Net-SSLeay \
		p5-XML-LibXML>=0:textproc/p5-XML-LibXML \
		p5-DBD-SQLite>=0:databases/p5-DBD-SQLite \
		p5-DBIx-Simple>=0:databases/p5-DBIx-Simple \
		p5-Test-File-ShareDir>=0:devel/p5-Test-File-ShareDir \
		p5-CGI>=0:www/p5-CGI \
		p5-Email-Simple>=0:mail/p5-Email-Simple \
		p5-Mail-DKIM>=0:mail/p5-Mail-DKIM \
		p5-Net-IMAP-Simple>=0:mail/p5-Net-IMAP-Simple \
		p5-Net-Server>=0:net/p5-Net-Server \
		p5-Net-HTTP>=0:net/p5-Net-HTTP \
		p5-Test-Output>=0:devel/p5-Test-Output \
		p5-Net-DNS>=0:dns/p5-Net-DNS \
		p5-Net-IDN-Encode>=0:textproc/p5-Net-IDN-Encode \
		p5-libwww>=0:www/p5-libwww \
		p5-URI>=0:net/p5-URI

USES=		perl5 shebangfix
USE_PERL5=	configure

SHEBANG_FILES=	bin/*
NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
