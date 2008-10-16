# ex:ts=8
# New ports collection makefile for:	perltidy
# Date created:			Mar 4, 2001
# Whom:				Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $MidnightBSD: mports/devel/perltidy/Makefile,v 1.1 2008/03/21 20:30:05 laffer1 Exp $
# $FreeBSD: ports/devel/perltidy/Makefile,v 1.33 2008/01/21 23:55:59 leeym Exp $
#

PORTNAME=	perltidy
PORTVERSION=	20071205
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:S/%SUBDIR%/Perl/} \
		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	Perl-Tidy-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Indents and reformats Perl scripts to make them easier to read
LICENSE=	gpl2

PERL_CONFIGURE=	yes

MAN1=		perltidy.1
MAN3=		Perl::Tidy.3

.include <bsd.port.mk>
