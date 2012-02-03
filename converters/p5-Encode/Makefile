# $MidnightBSD: mports/converters/p5-Encode/Makefile,v 1.6 2011/05/13 13:14:22 laffer1 Exp $

PORTNAME=	Encode
PORTVERSION=	2.44
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/D/DA/DANKOGAI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides interfaces between strings and the rest of the system
LICENSE=        perl

PERL_CONFIGURE=	yes

MAN3=		Encode.3 \
		Encode::Alias.3 \
		Encode::CJKConstants.3 \
		Encode::CN::HZ.3 \
		Encode::Config.3 \
		Encode::Encoder.3 \
		Encode::Encoding.3 \
		Encode::GSM0338.3 \
		Encode::Guess.3 \
		Encode::JP::H2Z.3 \
		Encode::JP::JIS7.3 \
		Encode::KR::2022_KR.3 \
		Encode::MIME::Header.3 \
		Encode::MIME::Name.3 \
		Encode::PerlIO.3 \
		Encode::Supported.3 \
		Encode::Unicode::UTF7.3 \
		encoding.3

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -pi -e '$$_="" if $$.>=24 && $$.<=26; $$_="my \@exe_files=();\n" if $$.==25' ${WRKSRC}/Makefile.PL

post-configure:
	@${FIND} ${WRKSRC}/ -name Makefile -exec \
		${REINPLACE_CMD} -e 's,^CC =,CC ?=,' {} \;

.include <bsd.port.post.mk>
