# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD: head/mail/p5-Email-Address-XS/Makefile 472914 2018-06-20 19:36:06Z sunpoet $
# $MidnightBSD$

PORTNAME=	Email-Address-XS
PORTVERSION=	1.04
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and format RFC 2822 email addresses and groups

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Email/Address/XS/XS.so

.include <bsd.port.mk>
