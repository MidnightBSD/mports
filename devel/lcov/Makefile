# Created by: Romain Tartiere <romain@FreeBSD.org>

PORTNAME=	lcov
PORTVERSION=	1.15
CATEGORIES=	devel
MASTER_SITES=	SF/ltp/Coverage%20Analysis/LCOV-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux Test Project GCOV extension

LICENSE=	gpl2

RUN_DEPENDS=	bash:shells/bash

NO_BUILD=	yes
USES=		gmake perl5 shebangfix
USE_PERL5=	run
SHEBANG_FILES=	bin/lcov bin/gendesc bin/genhtml bin/genpng bin/geninfo \
		bin/*.sh
INSTF=	genhtml geninfo genpng gendesc lcov

post-patch:
	${REINPLACE_CMD} -e 's:$$(PREFIX)/share/man:$$(PREFIX)/man:' ${WRKSRC}/Makefile

do-install:
.for f in ${INSTF}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/${f} ${PREFIX}/bin/${f}
.endfor
	${INSTALL_DATA} ${WRKSRC}/lcovrc ${PREFIX}/etc/lcovrc


.include <bsd.port.mk>
