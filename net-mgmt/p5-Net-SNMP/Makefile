PORTNAME=	Net-SNMP
PORTVERSION=	6.0.1
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DTOWN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object oriented interface to SNMP
WWW=		https://metacpan.org/release/Net-SNMP

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Crypt-DES>=0:security/p5-Crypt-DES \
		p5-Digest-SHA1>=0:security/p5-Digest-SHA1 \
		p5-Digest-HMAC>=0:security/p5-Digest-HMAC

USES=		perl5
USE_PERL5=	configure
CONFLICTS=	p5-Net-SNMP3-[0-9]*
NO_ARCH=	yes

.include <bsd.port.mk>
