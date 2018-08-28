# $MidnightBSD$
# $FreeBSD: head/www/p5-Cookie-Baker/Makefile 449893 2017-09-15 08:58:46Z mat $

PORTNAME=	Cookie-Baker
PORTVERSION=	0.05
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for cookie string generator/parser

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	\
	p5-URI>0:net/p5-URI
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	modbuild
NO_ARCH=	YES
PERL_MODBUILD=	yes

.include <bsd.port.mk>
