PORTNAME=	zetaback
PORTVERSION=	1.0.7
CATEGORIES=	sysutils
MASTER_SITES=	http://mirrors.omniti.com/zetaback/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Zetaback ZFS backup and recovery management system

LICENSE=	bsd3

USES=		perl5
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf

post-install:
	@${TEST} ! -f ${PREFIX}/etc/zetaback.conf && ${CP} ${PREFIX}/etc/zetaback.conf.sample ${PREFIX}/etc/zetaback.conf; ${TRUE}
	@${TEST} ! -f ${PREFIX}/etc/zetaback_agent.conf && ${CP} ${PREFIX}/etc/zetaback_agent.conf.sample ${PREFIX}/etc/zetaback_agent.conf; ${TRUE}

.include <bsd.port.mk>
