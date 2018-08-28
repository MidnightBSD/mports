# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD: head/www/p5-LWP-Protocol-https/Makefile 373448 2014-11-26 13:08:24Z mat $
# $MidnightBSD$

PORTNAME=	LWP-Protocol-https
PORTVERSION=	6.07
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provide https support for LWP::UserAgent

LICENSE=	artistic gpl
LICENSE_COMB=	dual

# We remove p5-libwww here to avoid cyclic dependency
BUILD_DEPENDS=	p5-IO-Socket-SSL>=1.54:${PORTSDIR}/security/p5-IO-Socket-SSL \
		p5-Mozilla-CA>=20110101:${PORTSDIR}/www/p5-Mozilla-CA \
		p5-Net-HTTP>=6:${PORTSDIR}/net/p5-Net-HTTP \
		p5-libwww>=6.06:www/p5-libwww
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
USES=		perl5

.include <bsd.port.mk>
