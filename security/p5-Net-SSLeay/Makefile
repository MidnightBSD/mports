PORTNAME=	Net-SSLeay
PORTVERSION=	1.92
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to SSL
WWW=		https://metacpan.org/release/Net-SSLeay

LICENSE=	other

OPTIONS_DEFINE=	EXAMPLES

CONFIGURE_ENV=	OPENSSL_PREFIX=${OPENSSLBASE}
USES=		perl5 shebangfix ssl
USE_PERL5=	configure

NO_TEST=	yes

PORTEXAMPLES=	*

SHEBANG_FILES=	examples/*.pl

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Net/SSLeay/SSLeay.so
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/req.conf ${STAGEDIR}${EXAMPLESDIR}/req.conf

.include <bsd.port.mk>
