PORTNAME=	patchutils
PORTVERSION=	0.4.2
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://cyberelk.net/tim/data/patchutils/stable/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small collection of programs that operate on patch files
WWW=		http://cyberelk.net/tim/software/patchutils/ \
		https://github.com/twaugh/patchutils

LICENSE=	gpl2+

RUN_DEPENDS=	bash:shells/bash

USES=		perl5 python:run shebangfix tar:xz
GNU_CONFIGURE=	yes
SHEBANG_FILES=	patchview/gitdiff scripts/*.in

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${STAGEDIR}/${PREFIX}/share/man/man1
	${MV} ${STAGEDIR}${PREFIX}/bin/svndiff ${STAGEDIR}${PREFIX}/bin/svndiff.patchutils

.include <bsd.port.mk>
