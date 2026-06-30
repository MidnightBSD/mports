PORTNAME=	Mail-Sendmail
PORTVERSION=	0.82
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module implementing a simple, platform-independent mailer
WWW=		https://metacpan.org/release/Mail-Sendmail

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Sys-Hostname-Long>=0:sysutils/p5-Sys-Hostname-Long

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
