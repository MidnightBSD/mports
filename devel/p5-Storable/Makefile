# New ports collection makefile for:	p5-Storable
# Date created:				July 7th 1997
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Storable/Makefile,v 1.43 2005/06/11 16:12:52 skv Exp $
#

PORTNAME=	Storable
PORTVERSION=	2.15
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Storable
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistency for perl data structures

PERL_CONFIGURE=	yes

MAN3=		Storable.3

post-patch:
	@${PERL} -pi -e '$$_="" if /MAN3PODS|INSTALLDIRS/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
