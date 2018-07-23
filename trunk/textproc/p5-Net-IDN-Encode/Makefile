# Created by: Timur Bakeyev <bat@cpan.org>
# $FreeBSD: head/textproc/p5-Net-IDN-Encode/Makefile 449893 2017-09-15 08:58:46Z mat $
# $MidnightBSD$

PORTNAME=	Net-IDN-Encode
PORTVERSION=	2.400
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalizing Domain Names in Applications (RFC 3490)

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Test-NoWarnings>=0:devel/p5-Test-NoWarnings

USES=		perl5
USE_PERL5=	modbuild
PERL_MODBUILD=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Net/IDN/Punycode/Punycode.so

.include <bsd.port.mk>
