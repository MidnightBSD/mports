PORTNAME=	Plack
PORTVERSION=	1.0047
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MIYAGAWA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension of PSGI reference implementation and utilities

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS} \
	p5-File-ShareDir-Install>=0.03:devel/p5-File-ShareDir-Install
RUN_DEPENDS=	\
	p5-Apache-LogFormat-Compiler>=0.33:www/p5-Apache-LogFormat-Compiler \
	p5-Cookie-Baker>=0.07:www/p5-Cookie-Baker \
	p5-Devel-StackTrace>=1.23:devel/p5-Devel-StackTrace \
	p5-Devel-StackTrace-AsHTML>=0.11:devel/p5-Devel-StackTrace-AsHTML \
	p5-File-ShareDir>=1.00:devel/p5-File-ShareDir \
	p5-Filesys-Notify-Simple>0:devel/p5-Filesys-Notify-Simple \
	p5-HTTP-Body>=1.06:www/p5-HTTP-Body \
	p5-HTTP-Entity-Parser>=0.17:www/p5-HTTP-Entity-Parser \
	p5-HTTP-Headers-Fast>=0.18:www/p5-HTTP-Headers-Fast \
	p5-Hash-MultiValue>=0.05:devel/p5-Hash-MultiValue \
	p5-Path-Class>0:devel/p5-Path-Class \
	p5-Stream-Buffered>=0.02:devel/p5-Stream-Buffered \
	p5-Try-Tiny>0:lang/p5-Try-Tiny \
	p5-URI>=1.59:net/p5-URI

USES=	perl5
USE_PERL5=	configure
NO_ARCH=	YES
NO_TEST=	yes

.include <bsd.port.mk>
