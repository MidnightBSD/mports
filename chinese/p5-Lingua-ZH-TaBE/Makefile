PORTNAME=	Lingua-ZH-TaBE
PORTVERSION=	0.07
PORTREVISION=	5
CATEGORIES=	chinese perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Chinese processing via libtabe
WWW=		https://metacpan.org/release/Lingua-ZH-TaBE

LICENSE=	NONE

LIB_DEPENDS=	libtabe.so:chinese/libtabe

USES=		bdb perl5
USE_PERL5=	configure

OBSOLETE_BDB_VAR=	WITH_DB

CONFIGURE_ARGS=	DB="${BDB_LIB_NAME}"

.include <bsd.port.mk>
