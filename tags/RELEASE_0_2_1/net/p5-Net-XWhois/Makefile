# New ports collection makefile for:	p5-Net-XWhois
# Date created:				11 June 2001
# Whom:	      				Danny Howard <dannyman@tellme.com>
#
# $MidnightBSD$
# $FreeBSD: ports/net/p5-Net-XWhois/Makefile,v 1.14 2006/12/25 15:19:29 erwin Exp $
#

PORTNAME=	Net-XWhois
PORTVERSION=	0.90
PORTREVISION=	4
CATEGORIES=	net perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Net
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Whois Client Interface for Perl5

PERL_CONFIGURE=	YES

MAN3=		Net::XWhois.3

post-patch:
	@${FIND} ${WRKSRC} -type f -name "*.orig" -delete

.include <bsd.port.mk>
