# $MidnightBSD$

PORTNAME=	Text-Iconv
PORTVERSION=	1.7
PORTREVISION=	2
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to iconv() codeset conversion function

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		iconv:translit

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	INC="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib -liconv"

.include <bsd.port.mk>
