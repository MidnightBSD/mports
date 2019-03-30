# Created by: Anton Berezin <tobez@FreeBSD.org>

PORTNAME=	File-ShareDir
PORTVERSION=	1.116
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locate per-dist and per-module shared files

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Inspector>=1.12:devel/p5-Class-Inspector \
		p5-File-ShareDir-Install>=0.13:devel/p5-File-ShareDir-Install

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
