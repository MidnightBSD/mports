# New ports collection makefile for:	p5-Email-MIME
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt
#
# $MidnightBSD$

PORTNAME=	Email-MIME
PORTVERSION=	1.937
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy MIME message parsing

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Email-Simple>=2.100:${PORTSDIR}/mail/p5-Email-Simple \
		p5-Email-MessageID>=0:${PORTSDIR}/mail/p5-Email-MessageID \
		p5-Email-MIME-Encodings>=1.313:${PORTSDIR}/mail/p5-Email-MIME-Encodings \
		p5-Email-MIME-ContentType>=1.01.1:${PORTSDIR}/mail/p5-Email-MIME-ContentType \
		p5-MIME-Types>=1.13:${PORTSDIR}/mail/p5-MIME-Types
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
