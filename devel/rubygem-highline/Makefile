PORTNAME=	highline
PORTVERSION=	3.1.2
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level IO library for command-line interfaces
WWW=		https://github.com/JEG2/highline

LICENSE=	gpl2 ruby
LICENSE_COMB=	dual
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING

BUILD_DEPENDS=	rubygem-reline>=0:devel/rubygem-reline
RUN_DEPENDS=	rubygem-reline>=0:devel/rubygem-reline

USES=		gem shebangfix

NO_ARCH=	yes

SHEBANG_FILES=	bin/test

.include <bsd.port.mk>
