PORTNAME=	Date-Japanese-Era
PORTVERSION=	0.08
CATEGORIES=	japanese perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Conversion between Japanese Era / Gregorian calendar
WWW=		https://metacpan.org/release/Date-Japanese-Era

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Date-Calc>=4.3:devel/p5-Date-Calc \
		ja-p5-Lingua-JA-Numbers>=0.04:japanese/p5-Lingua-JA-Numbers

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
