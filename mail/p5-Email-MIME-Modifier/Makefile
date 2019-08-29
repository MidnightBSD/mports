# New ports collection makefile for:	mail/p5-Email-MIME-Modifier
# Date created:				October 11, 2008
# Whom:					Lucas Holt

PORTNAME=	Email-MIME-Modifier
PORTVERSION=	1.444
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modify Email::MIME Objects Easily

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Email-MIME-Encodings>=1.3:${PORTSDIR}/mail/p5-Email-MIME-Encodings \
		p5-Email-MIME>=1.82:${PORTSDIR}/mail/p5-Email-MIME \
		p5-Email-MessageID>=1.2:${PORTSDIR}/mail/p5-Email-MessageID \
		p5-Email-MIME-ContentType>=1.0:${PORTSDIR}/mail/p5-Email-MIME-ContentType \
		p5-Email-Simple>=1.92:${PORTSDIR}/mail/p5-Email-Simple
RUN_DEPENDS=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
NO_TEST=	yes

.include <bsd.port.mk>
