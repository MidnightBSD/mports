PORTNAME=	Mojolicious
PORTVERSION=	9.38
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level MVC web framework written in Perl
WWW=		https://metacpan.org/pod/Mojolicious \
		https://www.mojolicious.org

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

# magus
NO_TEST=	yes

#TEST_DEPENDS=	p5-IO-Socket-Socks>=0.64:net/p5-IO-Socket-Socks \
#		p5-Role-Tiny>=2.000001:devel/p5-Role-Tiny \
#		p5-YAML-LibYAML>0:textproc/p5-YAML-LibYAML \
#		${JSONXS_BUILD_DEPENDS}

USES=		cpe perl5
USE_PERL5=	configure

NO_ARCH=	yes
#TEST_ARGS=	TEST_ASYNC_AWAIT=1 TEST_EV=1 TEST_HYPNOTOAD=1 \
#		TEST_IPV6=1 TEST_MORBO=1 TEST_ONLINE=1 TEST_PREFORK=1 \
#		TEST_SOCKS=1 TEST_SUBPROCESS=1 TEST_TLS=1 TEST_UNIX=1 \
#		HARNESS_OPTIONS=j$$(sysctl -n hw.ncpu)

OPTIONS_DEFINE=	EV JSONXS TLS
OPTIONS_DEFAULT=EV TLS

EV_DESC=		High-performance event loop via p5-EV
EV_BUILD_DEPENDS=	p5-EV>=4:devel/p5-EV
EV_RUN_DEPENDS=		p5-EV>=4:devel/p5-EV

JSONXS_DESC=		High-performance JSON parsing via p5-Cpanel-JSON-XS
JSONXS_BUILD_DEPENDS=	p5-Cpanel-JSON-XS>=4.09:converters/p5-Cpanel-JSON-XS
JSONXS_RUN_DEPENDS=	p5-Cpanel-JSON-XS>=4.09:converters/p5-Cpanel-JSON-XS

TLS_BUILD_DEPENDS=	p5-IO-Socket-SSL>=2.009:security/p5-IO-Socket-SSL
TLS_RUN_DEPENDS=	p5-IO-Socket-SSL>=2.009:security/p5-IO-Socket-SSL

.include <bsd.port.mk>
