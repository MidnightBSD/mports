PORTNAME=	Lingua-JA-Romanize-Japanese
PORTVERSION=	0.23
CATEGORIES=	japanese perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=CPAN:KAWASAKI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Romanization of Japanese language
WWW=		https://metacpan.org/release/Lingua-JA-Romanize-Japanese

LICENSE=	gpl2+

BUILD_DEPENDS=	p5-libwww>=0:www/p5-libwww

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

MAKE_ENV+=	DISABLE_DIC_DOWNLOAD=1

.include <bsd.port.mk>
