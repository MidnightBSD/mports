# $MidnightBSD$

PORTNAME=	JSON-PP
PORTVERSION=	2.27300
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAKAMAKA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON::XS compatible pure-Perl module

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
PERL_CONFIGURE=	yes

SUB_FILES=	pkg-install

.include <bsd.port.pre.mk>

pre-patch:
	@${MV} ${WRKSRC}/bin/json_pp ${WRKSRC}/bin/p5json_pp
	@${REINPLACE_CMD} -e 's|bin/json_pp|bin/p5json_pp|' ${WRKSRC}/MANIFEST ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
