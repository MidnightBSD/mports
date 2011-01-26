# $MidnightBSD: mports/converters/p5-Text-Iconv/Makefile,v 1.3 2008/01/05 05:53:00 laffer1 Exp $

PORTNAME=	Text-Iconv
PORTVERSION=	1.7
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
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
