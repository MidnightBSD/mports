PORTNAME=	mythes
PORTVERSION=	1.2.4
CATEGORIES=	textproc
MASTER_SITES=	SF/hunspell/MyThes/${PORTVERSION}/
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple thesaurus library

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libhunspell-1.7.so:textproc/hunspell

USES=		compiler:c++11-lib libtool pathfix perl5 pkgconfig shebangfix
SHEBANG_FILES=	th_gen_idx.pl
USE_LDCONFIG=	yes
USE_PERL5=	run
INSTALL_TARGET=	install-strip

GNU_CONFIGURE=	yes

.include <bsd.port.mk>
