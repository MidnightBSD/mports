# $MidnightBSD$
# $FreeBSD: ports/devel/p5-JSON-RPC/Makefile,v 1.3 2010/01/28 23:45:30 kuriyama Exp $

PORTNAME=	JSON-RPC
PORTVERSION=	1.06
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DMAKI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl implementation of JSON-RPC 1.1 protocol

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Class-Accessor-Lite>=0:devel/p5-Class-Accessor-Lite \
		p5-HTTP-Message>=0:www/p5-HTTP-Message \
		p5-JSON>=0:converters/p5-JSON \
		p5-JSON-XS>=0:converters/p5-JSON-XS \
		p5-Plack>=0:www/p5-Plack \
		p5-Router-Simple>=0:www/p5-Router-Simple \
		p5-libwww>=0:www/p5-libwww
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	modbuild
PERL_MODBUILD=	yes

.include <bsd.port.mk>
