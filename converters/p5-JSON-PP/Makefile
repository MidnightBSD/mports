# $MidnightBSD$

PORTNAME=	JSON-PP
PORTVERSION=	2.27202
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAKAMAKA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON::XS compatible pure-Perl module
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN1=		p5json_pp.1
MAN3=		JSON::PP.3 \
		JSON::PP::Boolean.3

SUB_FILES=	pkg-install

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501400
PLIST_SUB=	BIN_JSON_PP=""
.else
PLIST_SUB=	BIN_JSON_PP="@comment "
.endif

pre-patch:
	@${MV} ${WRKSRC}/bin/json_pp ${WRKSRC}/bin/p5json_pp
	@${REINPLACE_CMD} -e 's|bin/json_pp|bin/p5json_pp|' ${WRKSRC}/MANIFEST ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
