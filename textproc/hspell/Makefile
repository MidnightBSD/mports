# Created by: Yonatan <onatan@gmail.com>


PORTNAME=	hspell
PORTVERSION=	1.4
CATEGORIES=	textproc hebrew
MASTER_SITES=	http://hspell.ivrix.org.il/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hebrew spellchecker and morphology engine

LICENSE=	agpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake perl5 shebangfix
USE_LDCONFIG=	yes
USE_PERL5=	build
GNU_CONFIGURE=	yes
CFLAGS+=	-fPIC
CONFIGURE_ARGS=	--enable-fatverb \
		--enable-shared

SUB_FILES=	pkg-message

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libhspell.so

.include <bsd.port.mk>
