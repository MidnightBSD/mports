PORTNAME=	IPC-ShareLite
PORTVERSION=	0.17
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Simple interface to access shared memory
WWW=		https://metacpan.org/release/IPC-ShareLite

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/IPC/ShareLite/ShareLite.so

.include <bsd.port.mk>
