PORTNAME=	aspell
PORTVERSION=	0.60.8
CATEGORIES=	textproc
MASTER_SITES=	GNU/aspell
PKGNAMESUFFIX=	-ispell

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ispell compatibility script for aspell

LICENSE=	lgpl2.1

RUN_DEPENDS=	aspell:textproc/aspell

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/ispell \
		bin/spell

post-patch:
	@${REINPLACE_CMD} -e '/^#CHECK_FLAGS/ s|#||' ${WRKSRC}/scripts/ispell

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/ispell ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/spell ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
