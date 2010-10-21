# $MidnightBSD$

PORTNAME=	OLE-Storage_Lite
PORTVERSION=	0.19
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for OLE document interface
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/IO/Stringy.pm:${PORTSDIR}/devel/p5-IO-stringy
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		OLE::Storage_Lite.3

.include <bsd.port.mk>
