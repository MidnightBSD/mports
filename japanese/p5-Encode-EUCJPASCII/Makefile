PORTNAME=	Encode-EUCJPASCII
PORTVERSION=	0.03
CATEGORIES=	japanese converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	ja-p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for eucJP-open
WWW=		https://metacpan.org/release/Unicode-Japanese

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	for F in ${SITE_ARCH}/auto/Encode/EUCJPASCII/EUCJPASCII.so; do \
		${CHMOD} +w ${FAKE_DESTDIR}$$F; \
		${STRIP_CMD} ${FAKE_DESTDIR}$$F; \
	done

.include <bsd.port.mk>
