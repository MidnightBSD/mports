PORTNAME=	patch
PORTVERSION=	2.8.1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU patch utility
WWW=		https://savannah.gnu.org/projects/patch/

LICENSE=	gpl3+

TEST_DEPENDS=	bash:shells/bash

USES=		cpe charsetfix gmake tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g
i386_CONFIGURE_ARGS=	--disable-year2038
CPE_VENDOR=	gnu

TEST_TARGET=	check

PLIST_FILES=	bin/gpatch share/man/man1/gpatch.1.gz

post-patch:
	@${REINPLACE_CMD} -e '/^LOG_COMPILER =/,+1s|$$(SHELL)|bash|' \
		${WRKSRC}/tests/Makefile.in

.include <bsd.port.mk>
