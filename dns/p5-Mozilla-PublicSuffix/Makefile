PORTNAME=	Mozilla-PublicSuffix
PORTVERSION=	1.0.6
DISTVERSIONPREFIX=	v
CATEGORIES=	dns perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get public suffix of domain name via Mozilla Public Suffix List
WWW=		https://metacpan.org/release/Mozilla-PublicSuffix

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

PATCH_DEPENDS=	public_suffix_list>=0:dns/public_suffix_list
BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-URI>=0:net/p5-URI

USES=		perl5
USE_PERL5=	modbuild

NO_ARCH=	yes

post-patch:
	@${CP} ${LOCALBASE}/share/public_suffix_list/public_suffix_list.dat ${WRKSRC}/effective_tld_names.dat

.include <bsd.port.mk>
