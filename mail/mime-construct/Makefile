# $MidnightBSD$

PORTNAME=	mime-construct
PORTVERSION=	1.11
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.argon.org/~roderick/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Construct and optionally send MIME messages from command line

LICENSE=	gpl2

BUILD_DEPENDS=	p5-MIME-Base64>=0:${PORTSDIR}/converters/p5-MIME-Base64 \
		p5-MIME-Types>=0:${PORTSDIR}/mail/p5-MIME-Types \
		p5-Proc-WaitStat>=0:${PORTSDIR}/devel/p5-Proc-WaitStat
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
