# New ports collection makefile for:	devel/p5-Clone
# Date created:				05 June 2002
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD: ports/devel/p5-Clone/Makefile,v 1.9 2007/08/21 08:20:58 tobez Exp $
# $MidnightBSD$
#

PORTNAME=	Clone
PORTVERSION=	0.27
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Clone
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Clone - recursively copy Perl datatypes
LICESE=		perl

PERL_CONFIGURE=	yes

MAN3=		Clone.3

post-patch:
	${PERL} -pi -e 'm.OPTIMIZE.&&s,.,,sg' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

