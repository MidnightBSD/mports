PORTNAME=	Verilog-Perl
PORTVERSION=	3.478
CATEGORIES=	cad perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Building point for Verilog support in the Perl language
WWW=		https://www.veripool.org/wiki/verilog-perl

LICENSE=	artistic2 lgpl3
LICENSE_COMB=	dual
LICENSE_FILE_ART20=	${WRKSRC}/COPYING

USES=		bison:wrapper gmake perl5
USE_PERL5=	configure
CONFIGURE_ENV=	CXX=${CXX}\
		CPP=${CPP}\
		CC=${CC}

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Verilog/Parser/*.so
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Verilog/Preproc/*.so

.include <bsd.port.mk>
