PORTNAME=	Plack
PORTVERSION=	1.0051
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MIYAGAWA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension of PSGI reference implementation and utilities
WWW=		https://metacpan.org/release/Plack

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS} \
		p5-File-ShareDir-Install>=0.06:devel/p5-File-ShareDir-Install
RUN_DEPENDS=	p5-Apache-LogFormat-Compiler>=0.33:www/p5-Apache-LogFormat-Compiler \
		p5-Cookie-Baker>=0.07:www/p5-Cookie-Baker \
		p5-Devel-StackTrace-AsHTML>=0.11:devel/p5-Devel-StackTrace-AsHTML \
		p5-Devel-StackTrace>=1.23:devel/p5-Devel-StackTrace \
		p5-File-ShareDir>=1.00:devel/p5-File-ShareDir \
		p5-Filesys-Notify-Simple>=0:devel/p5-Filesys-Notify-Simple \
		p5-Hash-MultiValue>=0.05:devel/p5-Hash-MultiValue \
		p5-HTTP-Entity-Parser>=0.25:www/p5-HTTP-Entity-Parser \
		p5-HTTP-Headers-Fast>=0.18:www/p5-HTTP-Headers-Fast \
		p5-HTTP-Message>=5.814:www/p5-HTTP-Message \
		p5-Stream-Buffered>=0.02:devel/p5-Stream-Buffered \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny \
		p5-URI>=1.59:net/p5-URI \
		p5-WWW-Form-UrlEncoded>=0.23:www/p5-WWW-Form-UrlEncoded
TEST_DEPENDS=	p5-Authen-Simple-Passwd>=0:security/p5-Authen-Simple-Passwd \
		p5-CGI-Compile>=0:www/p5-CGI-Compile \
		p5-CGI-Emulate-PSGI>=0:www/p5-CGI-Emulate-PSGI \
		p5-HTTP-Message>=0:www/p5-HTTP-Message \
		p5-HTTP-Request-AsCGI>=0:www/p5-HTTP-Request-AsCGI \
		p5-HTTP-Server-Simple-PSGI>=0:www/p5-HTTP-Server-Simple-PSGI \
		p5-IO-Handle-Util>=0:devel/p5-IO-Handle-Util \
		p5-libwww>=5.814:www/p5-libwww \
		p5-Log-Dispatch-Array>=0:devel/p5-Log-Dispatch-Array \
		p5-LWP-Protocol-http10>=0:www/p5-LWP-Protocol-http10 \
		p5-MIME-Types>=0:mail/p5-MIME-Types \
		p5-Test-MockTime-HiRes>=0.06:devel/p5-Test-MockTime-HiRes \
		p5-Test-Requires>=0:devel/p5-Test-Requires \
		p5-Test-TCP>=0:devel/p5-Test-TCP

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	YES
NO_TEST=	yes

.include <bsd.port.mk>
