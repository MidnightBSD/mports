PORTNAME=	Socket-GetAddrInfo
PORTVERSION=	0.22
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RFC 2553's getaddrinfo and getnameinfo functions
WWW=		https://metacpan.org/release/Socket-GetAddrInfo

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-ExtUtils-CChecker>=0.06:devel/p5-ExtUtils-CChecker

USES=		perl5 shebangfix
USE_PERL5=	modbuild
SHEBANG_FILES=	bin/getaddrinfo bin/getnameinfo
NO_ARCH=	yes

.include <bsd.port.mk>
