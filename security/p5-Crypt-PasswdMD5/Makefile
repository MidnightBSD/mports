PORTNAME=	Crypt-PasswdMD5
PORTVERSION=	1.46
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RSAVAGE
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module that provides interoperable MD5-based crypt() function
WWW=		https://metacpan.org/release/Crypt-PasswdMD5

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_RUN_DEPENDS=	p5-Crypt-URandom>=0:security/p5-Crypt-URandom

NO_ARCH=	yes
USES=		perl5 tar:tgz
USE_PERL5=	configure

.include <bsd.port.mk>
