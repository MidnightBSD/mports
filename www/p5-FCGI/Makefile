PORTNAME=	FCGI
PORTVERSION=	0.82
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules for perl5, for enabling FastCGI support in CGI scripts
WWW=		https://metacpan.org/release/FCGI

LICENSE=	OpenMarket
LICENSE_NAME=	Open Market License
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/FCGI/FCGI.so

.include <bsd.port.mk>
