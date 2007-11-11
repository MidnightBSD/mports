# New ports collection makefile for:	p5-MIME-Base32
# Date created:				2005-10-19
# Whom:					nork@freebsd.org
#
# $MidnightBSD: mports/converters/p5-MIME-Base32/Makefile,v 1.1 2007/03/20 19:28:17 laffer1 Exp $
# $FreeBSD: ports/converters/p5-MIME-Base32/Makefile,v 1.2 2005/10/29 06:42:43 nork Exp $
#

PORTNAME=	MIME-Base32
PORTVERSION=	1.01
PORTREVISION=	1
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	MIME
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for Base32 encodings
LICENSE=	unknown

PERL_CONFIGURE=	YES

MAN3=		MIME::Base32.3

post-extract:
	@${RM} ${WRKSRC}/test1.pl

.include <bsd.port.mk>
