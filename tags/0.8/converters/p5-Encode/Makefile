# $MidnightBSD$

PORTNAME=	Encode
PORTVERSION=	2.76
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DANKOGAI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides interfaces between strings and the rest of the system

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 502200
PLIST_SUB+=	OLD_PERL=""
.else
PLIST_SUB+=	OLD_PERL="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|bin/enc2xs||; s|bin/piconv||' ${WRKSRC}/Makefile.PL
.if ${PERL_LEVEL} >= 502200
	@${REINPLACE_CMD} -e 's|bin/encguess||' ${WRKSRC}/Makefile.PL
.endif

.include <bsd.port.post.mk>
