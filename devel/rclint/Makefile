PORTNAME=	rclint
PORTVERSION=	1.1.0
CATEGORIES=	devel textproc python
MASTER_SITES=	http://www.bayofrum.net/dist/rclint/	\
		FREEBSD_LOCAL/crees/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Checks rc scripts for style and common errors

LICENSE=	bsd2

USES=		python:run shebangfix
SHEBANG_FILES=	*.py

NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	${PORTNAME}
SUB_LIST=	PYTHON_CMD=${PYTHON_CMD}

PLIST_FILES=	bin/${PORTNAME}
PORTDATA=	${PORTNAME}.py errors.en

post-patch:
	${REINPLACE_CMD} -e "s,\(DATADIR = \)'\.',\1'${DATADIR}'," \
		${WRKSRC}/${PORTNAME}.py

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${PORTDATA:S,^,${WRKSRC}/,} ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
