PORTNAME=	mime-construct
PORTVERSION=	1.11
PORTREVISION=	2
CATEGORIES=	mail
MASTER_SITES=	http://www.argon.org/~roderick/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Construct and optionally send MIME messages from command line
WWW=		http://www.argon.org/~roderick/

LICENSE=	gpl2+

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-MIME-Types>=0:mail/p5-MIME-Types \
		p5-Proc-WaitStat>=0:devel/p5-Proc-WaitStat

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	ignore:1

.include <bsd.port.mk>
