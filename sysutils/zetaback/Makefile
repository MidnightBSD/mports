# $MidnightBSD$
# $FreeBSD: head/sysutils/zetaback/Makefile 326573 2013-09-07 06:47:20Z az $

PORTNAME=	zetaback
PORTVERSION=	1.0.4
CATEGORIES=	sysutils
MASTER_SITES=	https://labs.omniti.com/zetaback/tags/1.0/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Zetaback ZFS backup and recovery management system

LICENSE=	bsd3

USE_PERL5=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf

MAN1=		zetaback.1 zetaback_agent.1

post-install:
	@${TEST} ! -f ${PREFIX}/etc/zetaback.conf && ${CP} ${PREFIX}/etc/zetaback.conf.sample ${PREFIX}/etc/zetaback.conf; ${TRUE}
	@${TEST} ! -f ${PREFIX}/etc/zetaback_agent.conf && ${CP} ${PREFIX}/etc/zetaback_agent.conf.sample ${PREFIX}/etc/zetaback_agent.conf; ${TRUE}

.include <bsd.port.mk>
