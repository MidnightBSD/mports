# Created by: Sergey Skvortsov <skv@protey.ru>

PORTNAME=	Sys-Mmap
PORTVERSION=	0.20
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Map in a file as a Perl variable using mmap(2)

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Sys/Mmap/Mmap.so

.include <bsd.port.mk>
