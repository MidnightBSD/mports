PORTNAME=	HTML-Mason
PORTVERSION=	1.60
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance, dynamic web site authoring system
WWW=		https://metacpan.org/release/HTML-Mason

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Cache-Cache>=1:devel/p5-Cache-Cache \
		p5-Class-Container>=0.07:devel/p5-Class-Container \
		p5-Exception-Class>=1.15:devel/p5-Exception-Class \
		p5-HTML-Parser>=0:www/p5-HTML-Parser \
		p5-Log-Any>=0.08:devel/p5-Log-Any \
		p5-Params-Validate>=0.70:devel/p5-Params-Validate

OPTIONS_DEFINE=	MODPERL

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

MODPERL_BUILD_DEPENDS=	p5-libapreq2>=0:www/p5-libapreq2
MODPERL_RUN_DEPENDS=	p5-libapreq2>=0:www/p5-libapreq2
MODPERL_USE=		APACHE_RUN=22+

post-patch:
	@${REINPLACE_CMD} -e '/bin\/convert/d' ${WRKSRC}/Makefile.PL

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/blib/script/mason.pl ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
