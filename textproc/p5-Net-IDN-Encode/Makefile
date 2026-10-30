PORTNAME=	Net-IDN-Encode
PORTVERSION=	2.502
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RRWO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalizing Domain Names in Applications (RFC 3490)
WWW=		https://metacpan.org/release/Net-IDN-Encode

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Test-NoWarnings>=0:devel/p5-Test-NoWarnings

USES=		perl5
USE_PERL5=	modbuild

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${TRUE_PREFIX}/${SITE_PERL_REL}/auto/Net/IDN/Punycode/Punycode.so

.include <bsd.port.mk>
