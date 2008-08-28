# New ports collection makefile for:	p5-Sys-Hostname-Long
# Date created:				March 6th, 2004
# Whom:					Tim Bishop <tim@bishnet.net>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/p5-Sys-Hostname-Long/Makefile,v 1.4 2005/12/01 16:50:07 tdb Exp $
#

PORTNAME=	Sys-Hostname-Long
PORTVERSION=	1.4
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Sys
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Try every conceivable way to get full hostname

PERL_CONFIGURE=	yes

MAN3=		Sys::Hostname::Long.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
post-patch:
	@${PERL} -i -pe 's/}\(/}->(/' ${WRKSRC}/lib/Sys/Hostname/Long.pm
.endif

.include <bsd.port.post.mk>
