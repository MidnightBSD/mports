PORTNAME=	grc
PORTVERSION=	1.13
DISTVERSIONPREFIX=	v
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic Colouriser
WWW=		http://kassiopeia.juls.savba.sk/~garabik/software/grc.html

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	garabik

NO_BUILD=	yes

NO_ARCH=	yes
USES=		python:run shebangfix
SHEBANG_FILES=	grc grcat

post-patch:
.for i in grc grcat
	@${REINPLACE_CMD} -e \
		's|"/etc/grc|"${PREFIX}/etc/grc|g ; \
		 s|/usr/local/share/grc|${DATADIR}|g ; \
		 s|#! /usr/bin/env python3|#!${PYTHON_CMD}| ; \
		 s|, "/usr/share/grc/"||g' ${WRKSRC}/${i}
	@${REINPLACE_CMD} -e \
		's| /etc/grc| ${PREFIX}/etc/grc|g ; \
		 s|/usr/local/share/grc|${DATADIR}|g ; \
		 s|, /usr/share/grc/||g' ${WRKSRC}/${i}.1
.endfor
	(cd ${FILESDIR} && ${CP} colourfiles/conf.* ${WRKSRC}/colourfiles)

do-install:
.for i in grc grcat
	(cd ${WRKSRC} && ${INSTALL_SCRIPT} ${i} ${STAGEDIR}${PREFIX}/bin)
	(cd ${WRKSRC} && ${INSTALL_MAN} ${i}.1 ${STAGEDIR}${PREFIX}/share/man/man1)
.endfor
	(cd ${WRKSRC} && ${INSTALL_DATA} grc.conf ${STAGEDIR}${PREFIX}/etc)
	@${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} colourfiles/conf.* ${STAGEDIR}${DATADIR})

.include <bsd.port.mk>
