PORTNAME=	Fuse
PORTVERSION=	0.16.1
CATEGORIES=	filesystems sysutils perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DPATES
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Write filesystems in Perl using FUSE
WWW=		https://metacpan.org/release/Fuse

LICENSE=	lgpl2.1

USES=		perl5 fuse pkgconfig
USE_PERL5=	configure

PORTSCOUT=	limit:^[0-9\.]*$$

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Fuse/Fuse.so

.include <bsd.port.mk>
