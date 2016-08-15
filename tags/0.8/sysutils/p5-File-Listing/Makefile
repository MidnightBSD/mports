# $MidnightBSD$

PORTNAME=	File-Listing
PORTVERSION=	6.04
CATEGORIES=	sysutils perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse directory listings

LICENSE=	perl

RUN_DEPENDS=	p5-HTTP-Date>=6:${PORTSDIR}/www/p5-HTTP-Date
BUILD_DEPENDS:=	${RUN_DEPENDS}

CONFLICTS=	p5-libwww-5*

PERL_CONFIGURE=	yes

MAN3=		File::Listing.3

.include <bsd.port.mk>
