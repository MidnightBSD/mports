PORTNAME=	Net-LibIDN
PORTVERSION=	0.12
PORTREVISION=	5
CATEGORIES=	dns perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This module provides access to the libidn library
WWW=		https://metacpan.org/release/Net-LibIDN

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_ART10=	${WRKSRC}/Artistic

LIB_DEPENDS=	libidn.so:dns/libidn

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ARGS=	--with-libidn=${LOCALBASE}/lib \
		--with-libidn-inc=${LOCALBASE}/include

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Net/LibIDN/LibIDN.so

.include <bsd.port.mk>
