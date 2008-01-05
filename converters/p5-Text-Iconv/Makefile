# New ports collection makefile for:	Text::Iconv
# Date created:		26 Dec 2000
# Whom:			Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD: mports/converters/p5-Text-Iconv/Makefile,v 1.2 2007/09/24 22:13:00 ctriv Exp $
# $FreeBSD: ports/converters/p5-Text-Iconv/Makefile,v 1.12 2004/07/19 06:51:03 skv Exp $
#

PORTNAME=	Text-Iconv
PORTVERSION=	1.7
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Text
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to iconv() codeset conversion function
LICENSE=	perl

USE_ICONV=	yes

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	INC="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

MAN3=		Text::Iconv.3

.include <bsd.port.mk>
