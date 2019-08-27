# $MidnightBSD$

PORTNAME=	Email-Send
PORTVERSION=	2.201
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Email::Send - Simply Sending Email

LICENSE=        gpl2

BUILD_DEPENDS=	p5-Class-Accessor>=0.19:${PORTSDIR}/devel/p5-Class-Accessor \
		p5-Email-Address>=1.80:${PORTSDIR}/mail/p5-Email-Address \
		p5-Email-Simple>=1.92:${PORTSDIR}/mail/p5-Email-Simple \
		p5-Return-Value>=1.28:${PORTSDIR}/devel/p5-Return-Value \
		${SITE_PERL}/UNIVERSAL/require.pm:${PORTSDIR}/devel/p5-UNIVERSAL-require \
		p5-Net>0:${PORTSDIR}/net/p5-Net
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.mk>
