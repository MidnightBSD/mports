PORTNAME=	File-Find-Rule-Perl
PORTVERSION=	1.15
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common rules for searching for Perl things
WWW=		https://metacpan.org/release/File-Find-Rule-Perl

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-File-Find-Rule>=0.20:devel/p5-File-Find-Rule \
		p5-Params-Util>=0.38:devel/p5-Params-Util

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
