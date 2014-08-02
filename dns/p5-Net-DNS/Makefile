# $MidnightBSD$

PORTNAME=	Net-DNS
PORTVERSION=	0.78
CATEGORIES=	dns net perl5 ipv6
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to the DNS resolver, and dynamic updates

LICENSE=	perl

BUILD_DEPENDS=	p5-Digest-HMAC>=0:${PORTSDIR}/security/p5-Digest-HMAC
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Digest-BubbleBabble>=0:${PORTSDIR}/security/p5-Digest-BubbleBabble \
		p5-Test-Pod>=0:${PORTSDIR}/devel/p5-Test-Pod

OPTIONS_DEFINE=	IDN IPV6 DOCS

CONFIGURE_ARGS=	--no-IPv6-tests --no-online-tests
PERL_CONFIGURE=	yes
DOCSDIR=	${PREFIX}/share/doc/p5-Net-DNS

PORTDOCS=	Changes README TODO

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIDN}
BUILD_DEPENDS+=	p5-Net-LibIDN>=0:${PORTSDIR}/dns/p5-Net-LibIDN
RUN_DEPENDS+=	p5-Net-LibIDN>=0:${PORTSDIR}/dns/p5-Net-LibIDN
.endif

.if ${PORT_OPTIONS:MIPV6}
BUILD_DEPENDS+=	${SITE_PERL}/IO/Socket/INET6.pm:${PORTSDIR}/net/p5-IO-INET6
RUN_DEPENDS+=	${SITE_PERL}/IO/Socket/INET6.pm:${PORTSDIR}/net/p5-IO-INET6
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
