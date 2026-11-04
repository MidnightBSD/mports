PORTNAME=	YAML-Syck
DISTVERSION=	1.47
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TODDR
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, lightweight YAML and JSON loader and dumper
WWW=		https://metacpan.org/release/YAML-Syck

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/YAML/Syck/Syck.so

.include <bsd.port.mk>
