# $MidnightBSD$

PORTNAME=	Crypt-DES
PORTVERSION=	2.07
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to DES block cipher

LICENSE=	perl

BUILD_DEPENDS=	p5-Crypt-CBC>=0:${PORTSDIR}/security/p5-Crypt-CBC
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Crypt::DES.3

.include <bsd.port.mk>
