PORTNAME=	Data-UUID
PORTVERSION=	1.227
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate Globally/Universally Unique Identifiers (GUIDs/UUIDs)
WWW=		https://metacpan.org/release/Data-UUID

LICENSE=	bsd3

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ARGS=	</dev/null

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Data/UUID/UUID.so

.include <bsd.port.mk>
