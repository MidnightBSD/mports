# Created by: Anton Berezin <tobez@FreeBSD.org>

PORTNAME=	Sub-Name
PORTVERSION=	0.21
PORTEPOCH=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sub::Name - (re)name a sub

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENCE

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Sub/Name/Name.so

.include <bsd.port.mk>
